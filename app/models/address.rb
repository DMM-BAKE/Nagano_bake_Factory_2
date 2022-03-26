class Address < ApplicationRecord

  belongs_to :customer

  validates :postal_code, presence: true, length: {is: 7}
  validates :address, presence: true, length: { maximum: 60 }
  validates :name, presence: true, length: { maximum: 20 }
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end
end
