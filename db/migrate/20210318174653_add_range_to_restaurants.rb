class AddRangeToRestaurants < ActiveRecord::Migration[6.1]
  def change
    add_column :restaurants, :range, :integer
  end
end
