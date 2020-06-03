class MessagesController < ApplicationController
  before_action :set_event
  before_action :set_message, except: [:create]

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.event = @event
    @message.user = current_user
    if @message.save
      Notification.create(recipient: @event.user, actor: current_user, action: "sent", notifiable: @message)
      EventChannel.broadcast_to(
        @event,
        message: render_to_string(partial: "messages/message", locals: { message: @message })
      )
      redirect_to event_path(@event, anchor: "message-#{@message.id}", tab: "comment")
    else
      render 'events/show'
    end
  end

  def upvote
    authorize @message
    @message.liked_by current_user
    @message.save
    redirect_to event_path(@event, anchor: "message-#{@message.id}", tab: "comment"), notice: "You liked this!"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
