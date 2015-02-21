class ConversationsController < ApplicationController
  helper_method :mailbox, :conversation
  before_action :logged_in_user

  def create
    recipients = User.where(id: conversation_params(:recipients)).all

    conversation = current_user.
      send_message(recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversation_path(conversation)
  end

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    conversation
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  def empty_trash
    current_user.mailbox.trash.each do |conversation|
      conversation.receipts_for(current_user).update_all(:deleted => true)
    end
    redirect_to :conversations
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
