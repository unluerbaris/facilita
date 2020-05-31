class PollsController < ApplicationController
  before_action :set_event, only: [:create, :new]

  def new
  end

  def create
    @poll = Poll.new(polls_params)
    authorize @poll
    @poll.event = @event
    if @poll.save
      redirect_to event_path(@event)
    else
      render "events/show"
    end

    # if @poll.save
    #   EventChannel.broadcast_to(
    #     @event,
    #     poll: render_to_string(partial: "polls/poll", locals: { poll: @poll })
    #   )
    #   redirect_to event_path(@event, anchor: "poll-#{@poll.id}")
    # else
    #   render 'events/show'
    # end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def polls_params
    params.require(:poll).permit(:title, choices_attributes: [:answer])
  end
end
