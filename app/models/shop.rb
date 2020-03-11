class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  attr_accessor :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest


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

  # ramdom token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Shop.new_token
    update_attribute(:reset_digest,  Shop.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    ShopMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # # activates an account
  # def activate
  #   update_attribute(:activated, true)
  #   update_attribute(:activated_at, Time.zone.now)
  # end
  #
  # # Sends activation email.
  # def send_activation_email
  #   ShopMailer.account_activation(self).deliver_now
  # end

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Shop.new_token
      self.activation_digest = Shop.digest(activation_token)
    end

end
