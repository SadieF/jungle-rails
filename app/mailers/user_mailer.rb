class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
      @order = order
      @url = 'http://localhost:3000/orders/:id'
      mail(to: @order.email, subject: "Order ID: #{@order.id} Thank you for your purchase!")
    end
end
