# == Schema Information
#
# Table name: products_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#  product_id  :bigint
#
# Indexes
#
#  index_products_categories_on_category_id                 (category_id)
#  index_products_categories_on_product_id                  (product_id)
#  index_products_categories_on_product_id_and_category_id  (product_id,category_id) UNIQUE
#

class ProductsCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product_id, uniqueness: { scope: :category_id}
end
