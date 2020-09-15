class Event < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :title, presence:true
  # validates :type, presence:true
  enum event_type: [:party, :dinner, :repair, :holidays, :other]

  after_create :notify_users

  acts_as_notifiable :users,
    targets: ->(event, key) {
      event.flat.users - [event.user] - event.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :event_notifiable_path

  def event_notifiable_path
    event_path(event)
  end

  def notify_users
    notify :users, key: "event.create"
  end
end
