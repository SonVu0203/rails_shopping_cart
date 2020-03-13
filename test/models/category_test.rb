# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_shop_id                 (shop_id)
#  index_categories_on_shop_id_and_created_at  (shop_id,created_at)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
