class AddIpAddressToLocation < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :ip_address, :boolean
  end
end
