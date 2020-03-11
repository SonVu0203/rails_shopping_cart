class ShopMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shop_mailer.account_activation.subject
  #
  def account_activation(shop)
    @shop = shop
    mail to: shop.email, subject: 'Account is active'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.shop_mailer.password_reset.subject
  #
  def password_reset(shop)
    @shop = shop
    mail to: shop.email, subject: "Password is reset"
  end
end
