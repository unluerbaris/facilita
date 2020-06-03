class PollsController < ApplicationController
  before_action :set_event, only: [:index, :show, :create, :new]

  def index
    @polls = policy_scope(Poll.all)
    authorize Poll
  end

  def show
    @poll = Poll.find(params[:id])
    @choices = @poll.choices
    @response = Response.new
    authorize @poll
  end

  def create
    @poll = Poll.new(polls_params)
    authorize @poll
    @poll.event = @event
    if @poll.save
      redirect_to event_poll_path(@event, @poll)
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
