class User < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :paying_bills, class_name: 'Bill', foreign_key: 'paying_user_id'
  # has_many :paying_members, class_name: 'Bill', foreign_key: 'bill_members_user_id'
  has_one_attached :picture
  # devise :database_authenticatable, :confirmable, :invitable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true

  has_many :flatmembers, dependent: :destroy
  has_many :flats, through: :flatmembers

  has_many :messages, dependent: :destroy

  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy

  has_many :assigned_areas, class_name: 'Area', foreign_key: 'assigned_user_id'
  has_many :previously_assigned_areas, class_name: 'Area', foreign_key: 'previously_assigned_user_id'

  def living_in
    # flat_id = flatmembers.where(user_id: id, is_owner: false)
    # Flat.find flat_id
    flats.first
  end

  acts_as_target
end
