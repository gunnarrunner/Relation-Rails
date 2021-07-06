class CreateDiscsManufacturer < ActiveRecord::Migration[5.2]
  def change
    create_table :discs_manufacturers do |t|
      t.string :name
      t.string :location
      t.boolean :international
      t.integer :variety_of_discs
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
