class User < ApplicationRecord
  has_many :bills
  has_many :paying_bills, class_name: 'Bill', foreign_key: 'paying_user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
