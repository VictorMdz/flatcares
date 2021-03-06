module ApplicationHelper

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def notification_message(notification)
    case notification.notifiable_type
      when "Bill"
        "#{ notification.notifiable.user.first_name } added #{ notification.notifiable.name }"
      when "Event"
        "#{notification.notifiable.user.first_name} created a new event <strong>#{notification.notifiable.name}</strong> for #{notification.notifiable.date.day}/#{notification.notifiable.date.month}"
      when "Area"
        "You have been assigned to <strong>#{notification.notifiable.name}</strong>"
      when "Message"
        "<strong>#{notification.notifiable.user.first_name}</strong>: #{notification.notifiable.content}"
      end
  end

  def notification_user(notification)
    notification.notifiable_type == "Area" ? notification.notifiable.assigned_user : notification.notifiable.user
  end

  def notification_path(notification)
    case notification.notifiable_type
      when "Bill"
        Rails.application.routes.url_helpers.flat_bill_path(notification.notifiable.flat_id, notification.notifiable.id)
      when "Event"
        Rails.application.routes.url_helpers.flat_event_path(notification.notifiable.flat_id, notification.notifiable.id)
      when "Area"
        Rails.application.routes.url_helpers.flat_area_path(notification.notifiable.flat_id, notification.notifiable.id)
      when "Message"
        Rails.application.routes.url_helpers.flat_chatrooms_path(notification.notifiable.chatroom.flat_id, message_id: notification.notifiable.id)
      end
  end
end

