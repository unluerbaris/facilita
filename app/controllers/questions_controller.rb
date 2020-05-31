class QuestionsController < ApplicationController
  before_action :set_event

  def create
    @question = Question.new(question_params)
    authorize @question
    @question.event = @event
    @question.user = current_user
    if @question.save
      EventChannel.broadcast_to(
        @event,
        question: render_to_string(partial: "questions/question", locals: { question: @question })
      )
      redirect_to event_path(@event, anchor: "question-#{@question.id}")
    else
      render 'events/show'
    end
  end

  def upvote
    @event = Event.find(params[:id])
    @question = Question.find(params[:id])
    @question.upvote_from current_user
    authorize @question
  end

  def downvote
    @question = Question.find(params[:id])
    @question.downvote_from current_user
    authorize @question
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
