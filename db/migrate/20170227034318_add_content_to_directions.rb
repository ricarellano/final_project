class AddContentToDirections < ActiveRecord::Migration[5.0]
  def change
    add_column :directions, :content, :text
  end
end
