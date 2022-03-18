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

  # 別々で保存された名前をfull_nameで合わせて定義
  def full_name
    self.last_name + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end
  
  # is_deletedがfalseならturuを返す設定
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
end
