class ChangeTextFromProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :text, :active
  end
end
