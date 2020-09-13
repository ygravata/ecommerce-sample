class CartsController < ApplicationController
  before_action :set_cart, only:[:index, :checkout, :destroy]
  before_action :cart_items_count, only:[:index]

  def index
    @cart = current_user.carts.find_by_status("Active")
    cart_total_amount
  end

  def checkout
    unless @cart.nil?
      @cart.status = 'Inactive'
      @cart.save!
    end
    @inactive_cart = Cart.find(params[:id])
    cart_total_amount
  end

  def destroy
    # authorize @cart
    @cart.cart_products.destroy_all
    @cart.destroy
    redirect_to carts_path, notice: 'Cart empty'
  end

  private

  def cart_total_amount
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

  def set_cart
    if !current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
    end
  end

  def cart_items_count
    @cart_items_count = 0

    unless @cart.nil? || @cart.status == "Inactive"
      @cart.cart_products.each do |cart_product|
        @cart_items_count += cart_product.quantity
      end
    end
  end

end
