class QuestionsController < ApplicationController
  before_action :set_event
  before_action :set_question, except: [:create]


  def create
    @question = Question.new(question_params)
    authorize @question
    @question.event = @event
    @question.user = current_user
    if @question.save
      # Notification.create(recipient: @event.user, actor: current_user, action: "asked", notifiable: @question)
      EventChannel.broadcast_to(
        @event,
        question: render_to_string(partial: "questions/question", locals: { question: @question })
      )
      redirect_to event_path(@event, anchor: "question-#{@question.id}", tab: "question")
    else
      render 'events/show'
    end
  end

  def upvote
    authorize @question
    @question.liked_by current_user
    @question.save
    redirect_to event_path(@event, anchor: "question-#{@question.id}", tab: "question"), notice: "You liked this!"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:content)
  end
end
