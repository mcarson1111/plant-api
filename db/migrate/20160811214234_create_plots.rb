class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.integer :width
      t.integer :length
      t.integer :user_id
    end
  end
end
