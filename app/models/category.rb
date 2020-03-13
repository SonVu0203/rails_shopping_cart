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

class Category < ApplicationRecord
  belongs_to :shop
  has_many :images, as: :imageable, dependent: :destroy

  has_many :products_categories
  has_many :products, through: :products_categories

  default_scope -> { order( id: :asc) }

  validates :shop_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
end
