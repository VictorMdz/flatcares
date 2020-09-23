class Area < ApplicationRecord
  belongs_to :assigned_user, class_name: "User", optional: true
  belongs_to :previously_assigned_user, class_name: "User", optional: true
  belongs_to :flat
  has_many :tasks, dependent: :destroy

  enum category: AREA_CATEGORIES

  validates :name, presence: true

  before_create :assign_user
  after_create :notify_users

  after_destroy :clean_notifications

  acts_as_notifiable :users,
    targets: ->(area, key) {
      area.flat.users - area.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :area_notifiable_path

  def area_notifiable_path
    area_path(area)
  end

  def assign_user
    self.assigned_user = self.flat.users.sample
  end

  def notify_users
    notifications = notify :users, key: "area.update"
    NotificationChannel.broadcast_to(
      self.flat,
      ActionController::Base.new.render_to_string(partial: "flats/notification", locals: { notification: notifications.first })
    )
  end

  def clean_notifications
    ActivityNotification::Notification.where(notifiable: self).destroy_all
  end
end
