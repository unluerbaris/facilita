class AudiencesController < ApplicationController

  def create
    check_audience_in_event
    if @audience.nil?
      @audience = Audience.new
      authorize @audience
      @audience.event = @event
      @audience.user = current_or_guest_user
      if @audience.save
        redirect_to event_path(@event)
      else
        render 'pages/home'
      end
    else
      redirect_to event_path(@event)
    end
  end

  private

  def check_audience_in_event
    # If our token is valid, check if user and event are in same audience model
    @event = Event.find_by(token: params[:event_token])
    if !@event.nil?
      if @event.users.include? current_or_guest_user
        @audience = Audience.find_by(event_id: @event.id)
        authorize @audience
      end
    end
  end
end
