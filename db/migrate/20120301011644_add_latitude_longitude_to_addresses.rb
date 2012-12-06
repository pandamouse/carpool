class AddLatitudeLongitudeToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :integer

    add_column :addresses, :longitude, :integer

  end
end
