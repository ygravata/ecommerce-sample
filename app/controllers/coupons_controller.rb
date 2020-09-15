class CouponsController < ApplicationController
  before_action :set_coupon, only: [ :edit, :update, :destroy]

  def index
    @coupons = Coupon.all.order(active: :desc)
  end

  def create
    @coupon = Coupon.generate_coupon
    redirect_to coupons_path
  end

  def edit
    @coupon = Coupon.find(params[:id])
    # authorize @coupon
  end

  def update
    @coupon = Coupon.find(params[:id])
    @coupon.update(coupon_params)
    redirect_to coupons_path
  end


  def delete
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
    # authorize @product
  end

  def coupon_params
    params.require(:coupon).permit(:discount)
  end

end
