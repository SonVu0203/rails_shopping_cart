class AddTypeLoginToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :type_login, :integer, :default => 0
  end
end
