class RestaurantsController < ApplicationController
  protect_from_forgery
  include AjaxHelper

  def index
  end


  def show
    # DBから検索に必要な値を変数に格納
    lat = Restaurant.last[:latitude]
    lng = Restaurant.last[:longitude]
    range = Restaurant.last[:range]

    # 緯度･経度･半径を使い近い順に検索、インスタンス変数に格納
    @restaurants = Restaurant.search_location(lat, lng, range, 0)

    # Arrayに対してKaminariを適用する
    @restaurants = Kaminari.paginate_array(@restaurants).page(params[:page]).per(5)
  end

  def top
    # showアクションで得た一つの店舗情報をインスタンス変数に格納
    @restaurant = params
  end


  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save

    # jsを利用してredirectする
    respond_to do |format|
      format.js { render ajax_redirect_to(show_path) }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def restaurant_params
    params.permit(:range, :latitude, :longitude)
  end

end