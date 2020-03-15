module SessionsHelper
  # Logs in the given shop.
  def log_in(shop)
    session[:shop_id] = shop.id
  end

  # return true if product, category belong to shop
  def check_shop_is_loggin?(shop)
    if shop
      return true
    else
      return false
    end
  end
  # Returns true if the given shop is the current shop.
  def current_shop?(shop)
    shop == current_shop
  end

  # Returns the shop corresponding to the remember token cookie. -> chua hoan thanh
  def current_shop
    if session[:shop_id]
      @current_shop ||= Shop.find_by(id: session[:shop_id])
    end
  end

  # Returns true if the shop is logged in, false otherwise.
  def logged_in?
    !current_shop.nil?
  end

  # Logs out the current shop.
  def log_out
    session.delete(:shop_id)
    @current_shop = nil
  end
end
