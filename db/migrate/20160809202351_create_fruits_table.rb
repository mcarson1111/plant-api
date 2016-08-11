class CreateFruitsTable < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
        t.string :name
        t.string :soil
        t.integer :space
        t.string :regions
        t.string :sun
        t.string :companions
        t.string :foes

        t.timestamps null: false
    end

    create_table :herbs do |t|

      t.timestamps null: false
    end
  end
end
