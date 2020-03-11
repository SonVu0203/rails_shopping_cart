class Shop < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 11 }, format: { with: /(09|01[2|6|8|9])+([0-9]{8})\b/ }  #ex:0912345678
  validates :address, presence: true, length: { maximum: 150 }
  validates :tax_code, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # return a digest
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
