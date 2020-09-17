class Area < ApplicationRecord
  belongs_to :assigned_user, class_name: "User", optional: true
  belongs_to :previously_assigned_user, class_name: "User", optional: true
  belongs_to :flat
  has_many :tasks, dependent: :destroy
  validates :name, presence: true

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

  def notify_users
    notify :users, key: "area.update"
  end

  def clean_notifications
    ActivityNotification::Notification.where(notifiable: self).destroy_all
  end
end
