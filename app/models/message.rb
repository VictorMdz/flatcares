class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  validates :content, length: { minimum: 1 }

  after_create :notify_users

  acts_as_notifiable :users,
    targets: ->(message, key) {
      message.chatroom.flat.users - [message.user] - message.chatroom.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :bill_notifiable_path

  def message_notifiable_path
    message_path(message)
  end

  def notify_users
    notifications = notify :users, key: "message.create"
    NotificationChannel.broadcast_to(
      self.chatroom.flat,
      ActionController::Base.new.render_to_string(partial: "flats/notification", locals: { notification: notifications.first })
    )
  end
end
