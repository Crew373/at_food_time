class RemoveLogoImageFromRestaurants < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :logo_img, :string
  end
end
