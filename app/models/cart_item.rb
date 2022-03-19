class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_many :order_details, through: :item
  has_many :orders, through: :customer
  def subtotal(count)

  end

end
