class AddPasswordDigestToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :password_digest, :string
  end
end
