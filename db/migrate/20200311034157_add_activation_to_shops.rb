class AddActivationToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :activation_digest, :string
    add_column :shops, :activated, :boolean, default: false
    add_column :shops, :activated_at, :datetime
  end
end
