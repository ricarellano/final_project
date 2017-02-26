class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :address2
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
