class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :flat
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
