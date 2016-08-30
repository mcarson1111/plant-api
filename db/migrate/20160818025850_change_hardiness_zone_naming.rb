class ChangeHardinessZoneNaming < ActiveRecord::Migration
  def change
    change_table :fruits do |t|
      t.rename :hardiness_zone, :hardinessZone
    end

    change_table :herbs do |t|
      t.rename :hardiness_zone, :hardinessZone
    end

    change_table :flowers do |t|
      t.rename :hardiness_zone, :hardinessZone
    end
  end
end
