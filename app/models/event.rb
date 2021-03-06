class Event < ApplicationRecord
  include Notifiable

  belongs_to :user
  belongs_to :flat
  has_many :participations, dependent: :destroy

  validates :name, presence:true
  # validates :type, presence:true
  enum event_type: EVENT_TYPE

  after_create :create_participation

  def self.format_json(events)
    json = {}

    events.each do |event|
      year = event.date.year.to_s
      month = event.date.month.to_s
      day = event.date.day.to_s
      start_hour = event.start_time.strftime("%H:%M")
      end_hour = event.end_time.strftime("%H:%M")

      json[year] = json[year] || {}
      json[year][month] = json[year][month] || {}
      json[year][month][day] = json[year][month][day] || []

      json[year][month][day].push({
        startTime: start_hour,
        endTime: end_hour,
        text: event.name,
        link: Rails.application.routes.url_helpers.flat_event_path(event.flat, event)
      })
    end

    json.to_json
  end

  private

  def create_participation
    Participation.create(user_id: user_id, event_id: id, participating: true)

    flat.users.where.not(id: user_id).each do |user|
      Participation.create(user_id: user.id, event_id: id)
    end
  end
end


