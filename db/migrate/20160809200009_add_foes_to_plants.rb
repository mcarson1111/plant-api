class AddFoesToPlants < ActiveRecord::Migration
  def change

    add_column :plants, :sun, :string
    add_column :plants, :foes, :string

  end
end
