class CartsController < ApplicationController
  before_action :cart_find, oly:[:index, :checkout]
  before_action :cart_items_count

  def index
    @cart = current_user.carts.find_by_status("Active")
    cart_total
  end

  def checkout
    unless @cart.nil?
      @cart.status = 'Inactive'
      @cart.save!
    end
    @inactive_cart = Cart.find(params[:id])
    cart_total
  end

  private

  def cart_total
    @total = 0
    if @cart
       @cart.cart_products.each do |cart_product|
          @total += cart_product.product.price * cart_product.quantity
        end
    elsif @inactive_cart
       @inactive_cart.cart_products.each do |cart_product|
          @total += cart_product.product.price * cart_product.quantity
        end
    end
  end

  def cart_find
    if !current_user.nil?
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
