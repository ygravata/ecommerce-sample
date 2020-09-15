class CartsController < ApplicationController
  before_action :set_cart, only:[:index, :checkout, :check_coupon, :destroy, :set_checkout_coupon]
  before_action :set_coupon, only:[:check_coupon]
  before_action :set_checkout_coupon, only:[:checkout]
  before_action :cart_items_count, except: [:checkout]

  def index
    unless current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
      cart_total_amount
    end
  end

  def checkout
    unless @cart.nil?
      @cart.status = 'Inactive'
      @cart.save!
      @order = Order.create!(cart: @cart, user: current_user)
      if @coupon
        @coupon.active = false
        @coupon.save!
      end
      cart_total_amount
    else
      @inactive_cart = Cart.find(params[:id])
      cart_total_amount
    end
  end

  def destroy
    @cart.cart_products.destroy_all
    @cart.destroy
    redirect_to carts_path, notice: 'Cart empty'
  end

  def check_coupon
    if @coupon.active == true
      @coupon_discount = @coupon.discount
      @discount_calculation = (@coupon_discount.to_f/100)*cart_total_amount
      @cart.discount = @discount_calculation
      @cart.coupon_id = @coupon.id
      @cart.save
      redirect_to carts_path, notice: 'Coupon added!'
    else
      redirect_to carts_path, notice: "Coupon not valid."
    end
  end

  private

  def set_coupon
    @coupon =  Coupon.find_by(coupon_code: params['coupon'])
  end

  def set_checkout_coupon
    if !current_user.nil?
      unless @cart.nil? || @cart.coupon_id.nil?
        @coupon =  Coupon.find_by(id: @cart.coupon_id)
      end
    end
  end

  def cart_total_amount
    @total = 0
    if @cart
      @cart.cart_products.each do |cart_product|
        @total += cart_product.product.price * cart_product.quantity
      end
      @total
    elsif @inactive_cart
      @inactive_cart.cart_products.each do |cart_product|
        @total += cart_product.product.price * cart_product.quantity
      end
      @total
    end
  end
end
