class AddResetToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :reset_digest, :string
    add_column :shops, :reset_sent_at, :datetime

  end
end
