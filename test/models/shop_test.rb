# == Schema Information
#
# Table name: shops
#
#  id                :bigint           not null, primary key
#  activated         :boolean          default(FALSE)
#  activated_at      :datetime
#  activation_digest :string
#  address           :string
#  description       :text
#  email             :string
#  name              :string
#  password_digest   :string
#  phone             :string
#  reset_digest      :string
#  reset_sent_at     :datetime
#  tax_code          :string
#  type_login        :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
