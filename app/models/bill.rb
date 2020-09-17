class Bill < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  belongs_to :paying_user, class_name: 'User'
  belongs_to :flat

  has_one_attached :invoice

  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true
  validates :due_date, presence: true

  after_create :notify_users, :create_payments
  after_update :update_payments

  monetize :amount_cents


  acts_as_notifiable :users,
    targets: ->(bill, key) {
      bill.flat.users - [bill.user] - bill.flat.flatmembers.where(is_landlord: true)
    },
    notifiable_path: :bill_notifiable_path

  def status
    if Date.today > self.due_date
      "overdue"
    elsif self.payments.where(paid: true).count == self.payments.count
      "paid"
    else
      "pending"
    end
  end

  private

  def bill_notifiable_path
    bill_path(bill)
  end

  def notify_users
    notify :users, key: "bill.create"
  end


  def create_payments
    amount_by_users = ActionView::Base.new.humanized_money(amount).to_f / flat.users.count

    Payment.create(user_id: paying_user_id, bill_id: id, amount: amount_by_users, paid: true)

    flat.users.where.not(id: paying_user_id).each do |user|
      Payment.create(user_id: user.id, bill_id: id, amount: amount_by_users)
    end
  end

  def update_payments
    amount_by_users = ActionView::Base.new.humanized_money(amount).to_f / flat.users.count
    Payment.update(amount: amount_by_users, paid: true)
    flat.users.where.not(id: paying_user_id).each do |user|
      Payment.update(amount: amount_by_users, paid: false)
    end
  end

end
