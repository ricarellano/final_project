class AddDistanceToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :distance, :float
  end
end
