class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :participations, dependent: :destroy

  has_many :assigned_areas, class_name: 'Area', foreign_key: 'assigned_user_id'
  has_many :previously_assigned_areas, class_name: 'Area', foreign_key: 'previously_assigned_user_id'

end
