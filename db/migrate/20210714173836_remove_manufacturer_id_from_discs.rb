class RemoveManufacturerIdFromDiscs < ActiveRecord::Migration[5.2]
  def change
    remove_column :discs, :manufacturer_id, :integer
  end
end
