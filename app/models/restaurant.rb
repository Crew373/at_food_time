class Restaurant < ApplicationRecord
  validates :range, presence: true

  # 得たデータを必要なものだけに絞る
  def self.get_shop_info(data)
    shop = []
    data.each do |dt|
      shop.push({
      name:     dt["name"],
      access:   dt["access"],
      address:  dt["address"],
      logo_img: dt["logo_img"],
      open:     dt["open"],
      photo:    dt["photo"]["pc"]["l"]
      })
    end
    return shop
  end

  # 現在地から半径nmのお店を検索
  def self.search_location(lat, lng, range, order)
    restaurants = HotpepperApi.search_at_location(lat, lng, range, order)
    shop = get_shop_info(restaurants)
    return shop
  end
end