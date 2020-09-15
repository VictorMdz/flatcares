class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :paying_user, class_name: 'User'

  has_many :payments
  enum status: [:payed, :pending, :overdue]


  validates :name, presence: true
  validates :amount, presence: true
end
