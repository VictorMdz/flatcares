class Message < ApplicationRecord
  include Notifiable

  belongs_to :chatroom
  belongs_to :user
  validates :content, length: { minimum: 1 }

end
