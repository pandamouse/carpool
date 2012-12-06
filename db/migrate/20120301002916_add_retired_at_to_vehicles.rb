class AddRetiredAtToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :retired_at, :datetime

  end
end
