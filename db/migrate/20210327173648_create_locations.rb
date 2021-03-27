class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.integer :range, null: false

      t.timestamps
    end
  end
end
