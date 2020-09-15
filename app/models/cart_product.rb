class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates :quantity, presence: true

  def cart_product_total(cart_product)
    @cart_product_total = cart_product.product.price * cart_product.quantity
  end
end
