class AddBasePriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :base_price, :decimal
  end
end
