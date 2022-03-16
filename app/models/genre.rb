class Genre < ApplicationRecord
  acts_as_taggable
  has_many :items
end
