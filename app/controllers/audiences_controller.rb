class AudiencesController < ApplicationController

  def create
    @event = Event.find_by(token: params[:event_token])

    # If our token is valid, check if user and event are in same audience model
    if !@event.nil?
      if @event.users.include? current_user
        @audience = Audience.find_by(event_id: @event.id)
        authorize @audience
      end
    end

    if @audience.nil?
      @audience = Audience.new
      authorize @audience
      @audience.event = @event
      @audience.user = current_user
      if @audience.save
        redirect_to event_path(@event)
      else
        render 'pages/home'
      end
    else
      # If audience is not nil go to the event page
      redirect_to event_path(@event)
    end
  end
end
