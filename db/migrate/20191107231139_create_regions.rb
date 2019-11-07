class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.decimal :tax_amount

      t.timestamps
    end
  end
end
