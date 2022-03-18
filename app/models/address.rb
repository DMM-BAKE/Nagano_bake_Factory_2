class Address < ApplicationRecord

  belongs_to :customer

  validates :address, length: { maximum: 60 }
  validates :name, length: { maximum: 20 }

end
