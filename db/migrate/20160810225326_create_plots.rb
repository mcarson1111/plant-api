class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|

      t.timestamps null: false
    end
  end
end
