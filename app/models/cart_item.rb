class CartItem < ApplicationRecord
  
  belongs_to :customer
  belongs_to :item
  has_many :order_details, through: :items
  
  def subtotal(count)
    
  end
  
end
