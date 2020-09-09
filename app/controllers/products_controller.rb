class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @products = Product.all.order(created_at: :desc)
  end

end
