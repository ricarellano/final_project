class AddFoodToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :food, :string
  end
end
