class FeedbacksController < ApplicationController
  before_action :set_event, only: [:create, :new]

  def new
    @feedback = Feedback.new
    authorize @feedback
  end

  def create
    @feedback = Feedback.new(feedback_params)
    authorize @feedback
    @feedback.user = current_user

    if @feedback.save
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def feedback_params
    params.require(:feedback).permit(:comment, :rating, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
