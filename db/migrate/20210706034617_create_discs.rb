class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.string :name
      t.boolean :in_production
      t.integer :speed
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :manufacturer_id
      t.references :discs_manufacturer, foreign_key: true
    end
  end
end
