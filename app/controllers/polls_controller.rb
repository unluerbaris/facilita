class PollsController < ApplicationController
  before_action :set_event, only: [:show, :create]

  def show
    @poll = Poll.find(poll_params)
    authorize @poll
  end

  def new
    @poll = Poll.new
    authorize @poll
  end

  def create
    @poll = Poll.new(poll_params)
    authorize @poll

    if @poll.save
      redirect_to event_poll_path(@poll)
    else
      render :new
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def poll_params
    params.require(:poll)
  end
end
