class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :cart_find
  before_action :cart_items_count

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @cart_product = CartProduct.new
    # @review = Review.new
  end

  def upload
    @result = YAML.load_file(params[:upload][:file])
    add_products(@result)
    redirect_to(list_products_path)
  end

  def list
    @products = Product.all.order(created_at: :desc)
  end

  def edit
    # authorize @product
  end

  def update
    @product.update(product_params)
    redirect_to list_products_path
  end

  def destroy
    @product.destroy
    redirect_to list_products_path
  end

  def add_to_cart
    unless @cart
      @cart = Cart.new(status: "Active", user: current_user)
      @cart.save
    end

    if @cart.cart_products.find_by_product_id(params[:id])
      @cart_product = @cart.cart_products.find_by_product_id(params[:id])
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(quantity: 1)
      @cart_product.cart = @cart
      @cart_product.product = Product.find(params[:id])
    end

    # authorize @cart_product

    if @cart_product.save
        redirect_to products_path, notice: 'Product added to cart!'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand, :category, :image_url, :for, :desc1, :desc2,
      :specs_name, :specs_desc, :text, :price)
  end

  def set_product
    @product = Product.find(params[:id])
    # authorize @product
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

  def add_products(products)
    products.each do |product|
      new_product = Product.new(
        name: product['name'].capitalize, brand: product['brand'].capitalize,
        category: product['category'].capitalize,image_url: product['image_url'],
        for: product['for'], desc1: product['desc1'],
        desc2: product['desc2'], text: product['text']
        )

      unless product['specs'].nil?
        new_product.specs_name = product['specs'][0]['name']
        new_product.specs_desc = product['specs'][0]['desc']
      end

      new_product.desc2 = new_product.desc2.gsub(/<p>|<\/p>/, '')

      new_product.user = current_user

      new_product.save!
    end
  end


end