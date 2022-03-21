class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details
  validates :name, length: { maximum: 40 }
  validates :address, length: { maximum: 60 }

  enum payment_method: {
    credit_card: 0,
    transfer: 1,
  }
  
  


end
