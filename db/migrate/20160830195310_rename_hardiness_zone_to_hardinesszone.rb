class RenameHardinessZoneToHardinesszone < ActiveRecord::Migration
  def change
    change_table :veggies do |t|
      t.rename :hardinessZone, :hardinesszone
    end
    change_table :fruits do |t|
      t.rename :hardinessZone, :hardinesszone
    end
    change_table :herbs do |t|
      t.rename :hardinessZone, :hardinesszone
    end
    change_table :flowers do |t|
      t.rename :hardinessZone, :hardinesszone
    end
  end
end
