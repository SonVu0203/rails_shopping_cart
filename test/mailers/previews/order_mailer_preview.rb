# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_mail
    @order = Order.first
    OrderMailer.order_mail(@order)
  end
end
