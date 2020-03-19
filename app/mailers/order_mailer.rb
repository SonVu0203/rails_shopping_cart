class OrderMailer < ApplicationMailer

  def order_mail(order)
    @order = order
    mail to: order.email, subject: 'Thanks you for buy our products'
  end
end
