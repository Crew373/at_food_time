class RemoveLatitudeLongitudeFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :latitude, :float
    remove_column :restaurants, :longitude, :float
  end
end
