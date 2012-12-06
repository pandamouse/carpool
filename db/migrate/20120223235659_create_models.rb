class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :brand_name
      t.string :model
      t.integer :year

      t.timestamps
    end
  end
end
