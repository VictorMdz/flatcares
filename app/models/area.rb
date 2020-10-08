class Area < ApplicationRecord
  include Notifiable

  belongs_to :assigned_user, class_name: "User", optional: true
  belongs_to :previously_assigned_user, class_name: "User", optional: true
  belongs_to :flat
  has_many :tasks, dependent: :destroy

  enum category: AREA_CATEGORIES

  validates :name, presence: true
  validates :category, presence: true

  before_create :assign_user

  def assign_user
    self.assigned_user = self.flat.users.sample
  end
end
