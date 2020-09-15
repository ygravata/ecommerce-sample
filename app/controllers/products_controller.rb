class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_cart
  before_action :cart_items_count, except: [:checkout]

  def index
    if params[:query].present?
      @products = Product.active_products.global_search(params[:query]).order(created_at: :desc)
    else
      @products = Product.active_products.order(created_at: :desc)
    end
  end

  def show
    @cart_product = CartProduct.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    # authorize @product
    if @product.save
      redirect_to list_products_path, notice: 'Product created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to list_products_path
  end

  def list
    # admin products management view
    @products = Product.active_products.all.order(created_at: :desc)
  end

  def upload
    # action to upload yaml file with new products into the db
    @result = YAML.load_file(params[:upload][:file])
    yaml_add_products(@result)
    redirect_to(list_products_path)
  end

  def destroy
    # the destroy method won't really destroy,
    # will only set the product as active=false (so we keep the product relations, as orders or carts)
    @product.active = false
    @product.save!
    redirect_to list_products_path
  end

  def add_to_cart
    # action to be called in the show and index (product)
    #will add the products to the cart, grouping them by id (so we don't have duplicates in listing in the checkout)
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
  end

  def set_cart
    unless current_user.nil?
      @cart = current_user.carts.find_by_status("Active")
    end
  end

  def yaml_add_products(yaml_raw_file)
    # method to transform data of yaml file into new products
    yaml_raw_file.each do |product|
      new_product = Product.new(
        name: product['name'].titleize, brand: product['brand'].titleize,
        category: product['category'].titleize,image_url: product['image_url'],
        for: product['for'], desc1: product['desc1'],
        desc2: product['desc2'], price: product['price']
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
