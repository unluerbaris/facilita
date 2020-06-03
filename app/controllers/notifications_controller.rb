class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = policy_scope(Notification.where(recipient: current_user).unread)
    authorize Notification
  end

  def mark_as_read
    @notifications = policy_scope(Notification.where(recipient: current_user).unread)
    authorize Notification
    @notifications.update_all(read_at: Time.zone.now)
    render json: { success: true }
  end
end
