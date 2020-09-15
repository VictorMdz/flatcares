class Area < ApplicationRecord
  belongs_to :assigned_user, class_name: "User"
  belongs_to :previously_assigned_user, class_name: "User", optional: true
  has_many :tasks, dependent: :destroy
  validates :name, presence: true
end
