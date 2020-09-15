class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  belongs_to :paying_user, class_name: 'User'
  belongs_to :flat

  has_many :payments
  enum status: [:payed, :pending, :overdue]

  # validates :name, presence: true
  # validates :amount, presence: true
  after_create :notify_users

  acts_as_notifiable :users,
    targets: ->(bill, key) {
      bill.flat.users - [bill.user] - bill.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :bill_notifiable_path

  def bill_notifiable_path
    bill_path(bill)
  end

  def notify_users
    notify :users, key: "bill.crueate"
  end
end
