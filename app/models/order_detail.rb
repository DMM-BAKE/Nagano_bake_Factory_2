class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item
  validates :name, length: { maximum: 40 }
  validates :address, length: { maximum: 60 }

end
