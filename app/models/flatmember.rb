class Flatmember < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  def is_admin?
    is_admin
  end
end
