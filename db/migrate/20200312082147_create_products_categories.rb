class CreateProductsCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :products_categories do |t|
      t.bigint :product_id
      t.bigint :category_id
      t.timestamps
    end
    add_index :products_categories, :product_id
    add_index :products_categories, :category_id
  end
end

