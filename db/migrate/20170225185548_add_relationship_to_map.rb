class AddRelationshipToMap < ActiveRecord::Migration[5.0]
  def change
    add_reference :maps, :user, foreign_key: true
  end
end
