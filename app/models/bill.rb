class Bill < ApplicationRecord
  include Notifiable

  belongs_to :user
  belongs_to :flat
  belongs_to :paying_user, class_name: 'User'
  # belongs_to :bill_members_user, class_name: 'User'


  has_one_attached :invoice

  has_many :payments, dependent: :destroy

  enum category: CATEGORIES

  validates :name, presence: true
  validates :category, presence: :true
  validates :amount_cents, presence: true
  validates :due_date, presence: true

  after_create :create_payments

  after_update :update_payments

  monetize :amount_cents


  def status
    if (Date.today > self.due_date) && self.payments.where(paid: false).size > 0
      "Overdue"
    elsif self.payments.where(paid: true).count == self.payments.count
      "Paid"
    else
      "Pending"
    end
  end

  include PgSearch::Model
  scope :by_category, -> (category) { where(category: category) }
  scope :by_amount, -> (amounts) { where('amount_cents >= ? AND amount_cents <= ?', amounts.first * 100, amounts.last * 100) }
  scope :by_pending, -> () { where('due_date >= ?', Date.today) }
  scope :by_overdue, -> () { where('due_date <= ?', Date.today) }

  private

  def create_payments

    amount_by_users = ActionView::Base.new.humanized_money(amount).to_f / sharing_member.count

    if sharing_member.include?(paying_user_id)
      Payment.create(user_id: paying_user_id, bill_id: id, amount: amount_by_users, paid: true)

      (sharing_member - [paying_user_id]).each do |user|
        Payment.create(user_id: user, bill_id: id, amount: amount_by_users)
      end
    else
      sharing_member.each do |user|
        Payment.create(user_id: user, bill_id: id, amount: amount_by_users)
      end

    end
  end

  def update_payments
    amount_by_users = ActionView::Base.new.humanized_money(amount).to_f / flat.users.count

    payments.each do |payment|
      payment.update(amount: amount_by_users, paid: payment.user == paying_user)
    end
  end

end
