class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_one :order
  #validates only one active
  validates :status, presence: true, inclusion: { in: %w(Active Inactive) }

  attr_accessor :total_amount

  def total_amount(cart_products_array)
    @total = 0
    cart_products_array.each do |cart_product|
      @total += cart_product.product.price * cart_product.quantity
    end
    @total
  end

  def total_quantity(cart_products_array)
    @total = 0
    cart_products_array.each do |cart_product|
      @total += cart_product.quantity
    end
    @total
  end
end
