class ChangeRegionToHardinessZoneHerbs < ActiveRecord::Migration
  def change
    remove_column :herbs, :region, :string

    add_column :herbs, :hardiness_zone, :string
  end
end
