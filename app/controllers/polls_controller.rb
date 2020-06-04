class PollsController < ApplicationController
  before_action :set_event, only: [:index, :show, :create, :new]

  def index
    @polls = policy_scope(Poll.all)
    authorize Poll
  end

  def show
    @poll = Poll.find(params[:id])
    @choices = Choice.where(poll: @poll).where.not(answer: "")
    @response = Response.new
    authorize @poll
  end

  def create
    @poll = Poll.new(polls_params)
    authorize @poll
    @poll.event = @event
    @new_poll = Poll.new
    if @poll.save
      EventChannel.broadcast_to(
      @event,
      polls: render_to_string(partial: "polls/index", locals: { poll: @poll })
      )
      redirect_to event_poll_path(@event, @poll, anchor: "poll-#{@poll.id}", tab: "polls" )
    else
      render "events/show"
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def polls_params
    params.require(:poll).permit(:title, choices_attributes: [:answer])
  end
end
