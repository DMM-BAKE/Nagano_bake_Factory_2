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
    入金待ち: 0,
    入金確認: 1,
    製作中: 2,
    発送準備中: 3,
    発送済: 4,
  }

  enum address_option:{
    customer_address: 0,
    registration_address: 1,
    new_address: 2,
  }

end
