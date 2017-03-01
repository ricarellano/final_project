class AddCaloriesToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :calories, :integer
  end
end
