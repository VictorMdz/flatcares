class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :paying_user, class_name: 'User'
  has_many :payments

  validates :name, presence: true
  validates :amount, presence: true
end
