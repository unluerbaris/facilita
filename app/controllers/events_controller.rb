class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
    @new_message = Message.new
    @new_question = Question.new
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :photo)
  end
end
