class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :soil
      t.integer :space
      t.string :regions
      t.string :companions

      t.timestamps null: false
    end
  end
end
