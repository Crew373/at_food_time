class RemoveLocationFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :latitude
    remove_column :restaurants, :longitude
    remove_column :restaurants, :range
  end
end
