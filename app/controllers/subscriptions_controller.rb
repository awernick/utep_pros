class SubscriptionsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    current_user.subscribe(event)
    redirect_to event
  end

  def destroy
    event = Subscription.find(params[:id]).event
    current_user.unsubscribe(event)
    redirect_to event
  end
end