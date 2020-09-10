class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def upload
    @result = YAML.load_file(params[:upload][:file])
    add_products(@result)
    raise
  end


  def add_products(products)

    products.each do |product|
      new_product = Product.new(
        name: product['name'],
        brand: product['brand'],
        category: product['category'],
        image_url: product['image_url'],
        for: product['for'],
        desc1: product['desc1'],
        desc2: product['desc2'],
        specs_name: product['specs_name'],
        specs_desc: product['specs_desc'],
        text: product['text']
        )

      new_product.user = current_user
      new_product.save!
    end
  end

end
