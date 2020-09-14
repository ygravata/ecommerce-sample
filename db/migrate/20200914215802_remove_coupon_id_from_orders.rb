class RemoveCouponIdFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :coupon_id, :bigint
  end
end
