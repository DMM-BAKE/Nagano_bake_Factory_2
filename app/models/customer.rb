class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :first_name_kana, :last_name_kana, presence: true, length: { maximum: 60 }
  validates :postal_code, presence: true
  validates :address, presence: true, length: { maximum: 100 }
  validates :phone_number, presence: true, length: { maximum: 13 }


  # 別々で保存された名前をfull_nameで合わせて定義
  def full_name
    self.first_name + self.last_name
  end

  def full_name_kana
    self.first_name_kana + self.last_name_kana
  end

  # is_deletedがfalseならturuを返す設定
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
