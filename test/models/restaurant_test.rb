require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @restaurant = Restaurant.new(name: "name", access: "access", address: "address",
                                 open: "open", photo: "photo", range: 1,
                                 latitude: 34.67, longitude: 135.52)
  end

  test "should be valid" do
    assert @restaurant.valid?
  end
end
