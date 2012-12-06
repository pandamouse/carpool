class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :user_id,	:null=>false
      t.integer :passenger_space, :null=>false, :default=>0
      t.string :rego,		:null=>false
      t.string :colour
      t.integer :model_id
      t.boolean :child_seat,	:default=>false
      t.integer :boot,		:null=>false, :default=>0
      t.boolean :obsolete,	:default=>false

      t.timestamps
    end

    add_index :vehicles, :user_id
  end
end
