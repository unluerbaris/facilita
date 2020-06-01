class FeedbackController < ApplicationController

  def new
    @feedback = Feedback.new
    authorize @feedback
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    authorize @feedback

    if @feedback.save
      redirect_to feedback_path(@feedback)
    else
      render :new
    end
  end

  def feedback_params
    params.require(:question).permit(:question)
  end

end
