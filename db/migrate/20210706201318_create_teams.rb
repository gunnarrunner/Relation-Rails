class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :champions
      t.integer :wins

      t.timestamps
    end
  end
end
