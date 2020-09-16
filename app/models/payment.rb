class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :bill

  monetize :amount_cents

end
