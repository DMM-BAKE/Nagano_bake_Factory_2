class Genre < ApplicationRecord
  has_many :items

  validates :name, length: { maximum: 20 }
end
