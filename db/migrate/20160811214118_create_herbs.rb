class CreateHerbs < ActiveRecord::Migration
  def change
    create_table :herbs do |t|
      t.string :name
      t.string :soil
      t.integer :space
      t.string :sun
      t.string :start
      t.string :special
      t.string :deep
      t.string :time
      t.string :hardiness_zone
      t.string :companions
      t.string :foes
      t.string :photo 
    end
  end
end
