class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_many :order_details, through: :item
  has_many :orders, through: :customer

  def subtotal
    item.add_tax_price * item_count
  end

end
