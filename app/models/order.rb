class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  validates :name, length: { maximum: 40 }
  validates :address, length: { maximum: 60 }

  enum payment_method: {
    credit_card: 0,
    transfer: 1,
  }
  enum order_status: {
    waiting: 0,
    paid_up: 1,
    under_production: 2,
    preparing: 3,
    shipped: 4,
  }

end
