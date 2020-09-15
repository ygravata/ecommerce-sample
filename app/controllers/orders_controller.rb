class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :set_order_products]
  before_action :set_order_products, only: [:show]

  def index
    @orders = Order.order(created_at: :desc)
  end

  def show
  end

  def my_orders
    @orders = Order.where(user_id: current_user.id)
  end

  private

  def set_order
    if !current_user.nil?
      @order = Order.find(params[:id])
    end
  end

  def set_order_products
    if !current_user.nil?
      @cart_products = @order.cart.cart_products
    end
  end
end
