class MessagesController < ApplicationController
  before_action :set_event

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.event = @event
    @message.user = current_user
    if @message.save
      redirect_to event_path(@event, anchor: "message-#{@message.id}")
    else
      render 'events/show'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
