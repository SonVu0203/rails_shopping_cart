module SessionsCustomersHelper

  def log_in_customer(customer)
    session[:customer_id] = customer.id
  end

  # Returns true if the given shop is the current shop.
  def current_customer?(customer)
    customer == current_customer
  end

  # Returns the shop corresponding to the remember token cookie. -> chua hoan thanh
  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end

  # Returns true if the shop is logged in, false otherwise.
  def logged_in_customer?
    !current_customer.nil?
  end

  # Logs out the current shop.
  def log_out_customer
    session.delete(:customer_id)
    @current_customer = nil
  end
end
