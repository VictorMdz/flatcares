class Event < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :name, presence:true
  # validates :type, presence:true
  enum event_type: EVENT_TYPE

  after_create :notify_users
  after_destroy :clean_notifications

  acts_as_notifiable :users,
    targets: ->(event, key) {
      event.flat.users - [event.user] - event.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :event_notifiable_path


  def self.format_json(events)
    json = {}

    events.each do |event|
      year = event.start_date.year.to_s
      month = event.start_date.month.to_s
      day = event.start_date.day.to_s
      start_time = event.start_date.strftime("%H:%M")
      end_time = event.end_date.strftime("%H:%M")

      json[year] = json[year] || {}
      json[year][month] = json[year][month] || {}
      json[year][month][day] = json[year][month][day] || []

      json[year][month][day].push({
        startTime: start_time,
        endTime: end_time,
        text: event.name,
        link: Rails.application.routes.url_helpers.flat_event_path(event.flat, event)
      })
    end

    json.to_json
  end

  def event_notifiable_path
    event_path(event)
  end

  def notify_users
    notify :users, key: "event.create"
  end

  def clean_notifications
    ActivityNotification::Notification.where(notifiable: self).destroy_all
  end
end
