class QuestionsController < ApplicationController
  before_action :set_event

  def create
    @question = Question.new(question_params)
    authorize @question
    @question.event = @event
    @question.user = current_user
    if @question.save
      render 'events/show'
    else
      flash[:alert] = "cannot not send this comment"
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:question).permit(:content)
  end
end
