class FeedbacksController < ApplicationController
  before_action :set_event, only: [:create, :new, :index]

  def index
    @feedbacks = policy_scope(@event.feedbacks.all)
    authorize @feedbacks
  end

  def new
    @feedback = Feedback.new
    authorize @feedback
  end

  def create
    @feedback = Feedback.new(feedback_params)
    authorize @feedback
    @feedback.user = current_or_guest_user

    if current_user == @event.user
      flash[:alert] = "You can't send feedback to your own event!"
    elsif !@event.feedbacks.find_by_user_id(current_user).nil?
      flash[:alert] = "Can't post multiple feedbacks to an event!!!"
    else
      if @feedback.save
        redirect_to event_path(@event)
      else
        render :new
        flash[:alert] = "Something went wrong."
      end
    end
  end

  def feedback_params
    params.require(:feedback).permit(:comment, :rating, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
