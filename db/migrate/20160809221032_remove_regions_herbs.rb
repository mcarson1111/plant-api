class RemoveRegionsHerbs < ActiveRecord::Migration
  def change
    remove_column :herbs, :regions, :string
  end
end
