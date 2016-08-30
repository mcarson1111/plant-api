class ChangeSunToSunshine < ActiveRecord::Migration
  def change
    change_table :fruits do |t|
      t.rename :sun, :sunShine
    end

    change_table :herbs do |t|
      t.rename :sun, :sunShine
    end

    change_table :flowers do |t|
      t.rename :sun, :sunShine
    end

    change_table :veggies do |t|
      t.rename :sun, :sunShine
    end
  end
end
