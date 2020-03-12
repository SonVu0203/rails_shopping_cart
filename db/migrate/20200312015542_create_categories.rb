class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
    add_index :categories, [:shop_id, :created_at]
  end
end
