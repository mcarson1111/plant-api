class ChangeRegionToHardinessZone < ActiveRecord::Migration
  def change
    remove_column :veggies, :region, :string

    add_column :veggies, :hardiness_zone, :string
  end
end
