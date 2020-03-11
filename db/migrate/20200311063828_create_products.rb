class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, [:shop_id, :created_at]
  end
end
