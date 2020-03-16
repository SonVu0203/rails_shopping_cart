# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  address         :string
#  email           :string
#  name            :string
#  password_digest :string
#  phone           :string
#  type_login      :integer          default(1)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  before_save :downcase_email


  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: false }
  validates :phone, presence: true, length: { maximum: 11 }, format: { with: /(09|01[2|6|8|9])+([0-9]{8})\b/ }  #ex:0912345678
  validates :address, presence: true, length: { maximum: 150 }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  private
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

end
