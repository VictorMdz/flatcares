class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :bill, dependent: :destroy

  monetize :amount_cents

end
