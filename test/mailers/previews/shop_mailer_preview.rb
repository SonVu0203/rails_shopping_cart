# Preview all emails at http://localhost:3000/rails/mailers/shop_mailer
class ShopMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/shop_mailer/account_activation
  def account_activation
    # ShopMailer.account_activation
    shop = Shop.first
    shop.activation_token = Shop.new_token
    ShopMailer.account_activation(shop)
  end

  # Preview this email at http://localhost:3000/rails/mailers/shop_mailer/password_reset
  def password_reset
    # ShopMailer.password_reset
    shop = Shop.first
    shop.reset_token = Shop.new_token
    ShopMailer.password_reset(shop)
  end

end
