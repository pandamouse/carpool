class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address_1
      t.string :address_2
      t.string :suburb
      t.integer :postcode
      t.string :country

      t.timestamps
    end
  end
end
