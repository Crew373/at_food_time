class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :access
      t.string :address
      t.binary :logo_img
      t.datetime :open
      t.binary :photo

      t.timestamps
    end
  end
end
