class EventsController < ApplicationController
  def show
    @event = Event.find(event_params)
  end

  def new
    @event = Event.new()
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render :show
    else
      redirect_to new_event_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
