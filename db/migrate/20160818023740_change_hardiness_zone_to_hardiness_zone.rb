class ChangeHardinessZoneToHardinessZone < ActiveRecord::Migration
  def change
    change_table :veggies do |t|
      t.rename :hardiness_zone, :hardinessZone
    end
  end
end
