class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :paying_user, class_name: 'User'

  has_many :payments
  enum status: [:payed, :pending, :overdue]

  # validates :name, presence: true
  # validates :amount, presence: true
  after_create :notify_users

  acts_as_notifiable :users,
    targets: ->(bill, key) {
      raise
      # ([comment.article.user] + comment.article.reload.commented_users.to_a - [comment.user]).uniq
    },
    notifiable_path: :bill_notifiable_path

  def bill_notifiable_path
    bill_path(bill)
  end

  def notify_users
    notify :users, key: "bill.create"
  end
end
