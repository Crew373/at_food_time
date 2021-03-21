class ChangeDataLogoImgToRestaurants < ActiveRecord::Migration[6.1]
  def change
    change_column :restaurants, :logo_img, :string
    change_column :restaurants, :photo, :string
  end
end
