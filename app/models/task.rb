class Task < ApplicationRecord
  belongs_to :area
  validates :name, presence: true
end
