module Notifiable
  extend ActiveSupport::Concern

  included do
    after_create :notify_users
    after_destroy :clean_notifications

    acts_as_notifiable :users,
      targets: ->(notifiable, key) {
        case notifiable.class.name
          when "Message"
            notifiable.chatroom.flat.users - [notifiable.user] - notifiable.chatroom.flat.flatmembers.where(is_landlord: true)
          when "Area"
            notifiable.flat.users - notifiable.flat.flatmembers.where(is_landlord: true)
          else
            notifiable.flat.users - [notifiable.user] - notifiable.flat.flatmembers.where(is_landlord: true)
        end
      }
  end

  def notify_users
    notifications = notify :users, key: "mara.camille"

    NotificationChannel.broadcast_to(
      self.class.method_defined?(:chatroom) ? self.chatroom.flat : self.flat,
      message: ApplicationController.helpers.notification_message(notifications.first).try(:html_safe),
      notification_id: "#{notifications.first.notifiable_type}_#{notifications.first.notifiable_id}",
      url: ApplicationController.helpers.notification_path(notifications.first),
      user: ApplicationController.helpers.notification_target(notifications.first),
      html: ActionController::Base.new.render_to_string(partial: "flats/notification", locals: { notification: notifications.first })
    )
  end

  def clean_notifications
    ActivityNotification::Notification.where(notifiable: self).destroy_all
  end
end
