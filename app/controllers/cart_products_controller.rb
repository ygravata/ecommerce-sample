class CartProductsController < ApplicationController
  before_action :set_cart, only:[:create]
  before_action :set_cart_product, only:[:destroy, :add_unit, :reduce_unit]


  def create
    # action called at product show and product index
    unless @cart
      @cart = Cart.new(status: "Active", user: current_user)
      @cart.save
    end

    if @cart.cart_products.find_by_product_id(params[:id])
      @cart_product = @cart.cart_products.find_by_product_id(params[:id])
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(quantity: params[:cart_product][:quantity])
      @cart_product.cart = @cart
      @cart_product.product = Product.find(params[:product_id])
    end

    if @cart_product.save
      redirect_to products_path, notice: 'Product added to cart!'
    end
  end

  def add_unit
    # add unit to cart_product
    @cart_product.quantity +=1
    @cart_product.save
    redirect_to carts_path
  end

  def reduce_unit
    # reduce unit to cart_product
    @cart_product.quantity -= 1
    @cart_product.save
    redirect_to carts_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to carts_path, notice: 'Product removed from cart'
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end

  def set_cart_product
    if !current_user.nil?
      @cart_product = CartProduct.find(params[:id])
    end
  end
end
