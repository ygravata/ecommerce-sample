class ChangeStatusFromCoupon < ActiveRecord::Migration[6.0]
  def change
    rename_column :coupons, :status, :active
  end
end
