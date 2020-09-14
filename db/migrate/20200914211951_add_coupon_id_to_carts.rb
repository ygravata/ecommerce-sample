class AddCouponIdToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :coupon_id, :integer
  end
end
