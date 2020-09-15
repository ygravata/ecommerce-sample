class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_cart
  before_action :cart_items_count

  def set_cart
    unless current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
    end
  end

  def cart_items_count
    @cart_items_count = 0

    unless @cart.nil?
      @cart.cart_products.each do |cart_product|
        @cart_items_count += cart_product.quantity
      end
    end
  end
end
