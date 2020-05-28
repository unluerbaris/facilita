class PollsController < ApplicationController
  before_action :set_event, only: [:create]

  def new
    @poll = Poll.new
    authorize @poll
  end

  def create
    @poll = Poll.new(poll_params)
    authorize @poll
    @poll.event = @event

    if @poll.save
      EventChannel.broadcast_to(
        @event,
        poll: render_to_string(partial: "polls/poll", locals: { poll: @poll })
      )
      redirect_to event_path(@event, anchor: "poll-#{@poll.id}")
    else
      render 'events/show'
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
