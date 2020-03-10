class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.text :description
      t.string :tax_code

      t.timestamps
    end
  end
end
