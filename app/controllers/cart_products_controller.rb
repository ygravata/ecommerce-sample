class CartProductsController < ApplicationController
  before_action :set_cart, only:[:create]


  def create
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

    # authorize @cart_product

    if @cart_product.save
        redirect_to products_path, notice: 'Product added to cart!'
    end
  end


  def destroy
    @cart_product = CartProduct.find(params[:id])
    authorize @cart_product
    @cart_product.destroy
    redirect_to carts_path, notice: 'Product removed from cart'
  end


  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end

  def set_cart
    if !current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
    end
  end

end
