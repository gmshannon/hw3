class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    # Hardcoded places
    if params["id"] == "1"
      @place = { "id" => 1, "name" => "Bowling Green, FL" }
    elsif params["id"] == "2"
      @place = { "id" => 2, "name" => "Los Angeles, CA" }
    else
      @place = Place.find_by(id: params["id"])
    end

    if @place.nil?
      redirect_to "/places", alert: "Place not found."
    else
      @entries = Entry.where(place_id: @place["id"]) if @place.is_a?(Place)
    end
  end

end

