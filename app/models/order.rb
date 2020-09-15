class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  has_many :cart_products, through: :carts

  attr_accessor :order_products

  def order_products(order)
    order.cart.cart_products
  end
end
