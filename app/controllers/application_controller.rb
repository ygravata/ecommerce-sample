class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_cart
  before_action :cart_items_count


  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :birthdate])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def set_cart
    unless current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
    end
  end


  def cart_items_count
    # count cart products quantity, to display on cart icon of navbar
    @cart_items_count = 0

    unless @cart.nil?
      @cart.cart_products.each do |cart_product|
        @cart_items_count += cart_product.quantity
      end
    end
  end
end
