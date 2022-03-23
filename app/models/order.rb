class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  validates :postal_code, presence: true, length: {is: 7}
  validates :address, presence: true, length: { maximum: 60 }
  validates :name, presence: true, length: { maximum: 20 }

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

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end


end
