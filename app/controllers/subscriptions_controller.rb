class SubscriptionsController < ApplicationController
  before_action :logged_in_user   # Ensure that current_user is set
  
  # Subscribe current user to the given event
  def create
    event = Event.find(params[:event_id])
    current_user.subscribe(event)
    redirect_to event
  end

  # Unsubscribe current_user from the given event
  def destroy
    event = Subscription.find(params[:id]).event
    current_user.unsubscribe(event)
    redirect_to event
  end
end