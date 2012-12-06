class ChangeLatLngToNumberForAddresses < ActiveRecord::Migration
  def up
    change_column :addresses, :longitude, :decimal, :precision => 15, :scale => 10 
    change_column :addresses, :latitude, :decimal, :precision => 15, :scale => 10 
  end

  def down
    change_column :addresses, :longitude, :integer 
    change_column :addresses, :latitude, :integer 
  end
end
