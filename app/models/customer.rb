class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  validates :last_name, :first_name, length: { maximum: 20 }
  validates :last_name_kana, :first_name_kana, length: { maximum: 60 }
  validates :address, length: { maximum: 100 }
  validates :phone_number, length: { maximum: 13 }
  validates :encrypted_password, length: { minimum: 6, maximum: 15 }
  
end
