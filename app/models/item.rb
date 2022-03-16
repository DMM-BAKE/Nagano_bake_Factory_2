class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  validates :name, length: { maximum: 40 }

end
