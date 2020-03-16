module SessionsHelper
  # Logs in the given shop.
  def log_in(item)
    if item && item.type_login == 0
      session[:shop_id] = item.id
    else
      session[:user_id] = item.id
    end
  end

  # return true if product, category belong to shop
  def check_is_loggin?(item)
    if item && item.type_login == 0
      # shop login
      return 0
    elsif item && item.type_login == 1
      # user login
      return  1
    else
      return 2
    end
  end
  # Returns true if the given shop is the current shop.
  def current_login?(item)
    item == current_login
  end

  # Returns the shop corresponding to the remember token cookie. -> chua hoan thanh
  def current_login
    if session[:shop_id]
      @current_login ||= Shop.find_by(id: session[:shop_id])
    elsif session[:user_id]
      @current_login ||= User.find_by(id: session[:user_id])
    end
  end

  # return user

  # Returns true if the shop is logged in, false otherwise.
  def logged_in?
    !current_login.nil?
  end

  # Logs out the current shop.
  def log_out
    session.delete(:shop_id)
    session.delete(:user_id)
    @current_login = nil
  end
end
