class Flat < ApplicationRecord
  has_many :flatmembers, dependent: :destroy
  has_many :users, through: :flatmembers
  has_many :bills
  has_many :events
  has_many :areas

  has_many :chatrooms, dependent: :destroy
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
