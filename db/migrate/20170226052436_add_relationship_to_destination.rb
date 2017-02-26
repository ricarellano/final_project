class AddRelationshipToDestination < ActiveRecord::Migration[5.0]
  def change
    add_reference :destinations, :location, foreign_key: true
  end
end
