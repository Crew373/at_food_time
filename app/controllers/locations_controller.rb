class LocationsController < ApplicationController
  protect_from_forgery
  include AjaxHelper

  def create
    @location = Location.create(location_params)

    # jsを利用してredirectする
    respond_to do |format|
      format.js { render ajax_redirect_to(show_path) }
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def location_params
    params.permit(:latitude, :longitude, :range)
  end
end
