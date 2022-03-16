class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_details
  validates :name, length: { maximum: 40 }
  validates :address, length: { maximum: 60 }
  
end
