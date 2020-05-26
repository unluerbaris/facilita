class AudiencesController < ApplicationController

  def create
    @event = Event.find_by(token: params[:event_token])
    @audience = Audience.new
    @audience.event = @event
    @audience.user = current_user
    if @audience.save
      redirect_to event_path(@event)
    else
      flash[:alert] = "Could not join the event"
      render 'pages/home'
    end
  end
end
