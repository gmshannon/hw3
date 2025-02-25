class EntriesController < ApplicationController

  def new
    @place = Place.find_by(id: params[:place_id])

    # If the place is not found, redirect to the places list
    if @place.nil?
      redirect_to "/places", alert: "Place not found."
    end
  end

  def create
    @place = Place.find_by(id: params[:place_id])
  
    @entry = Entry.new(entry_params)
    @entry.place_id = @place["id"]
  
    
    if params[:date].present?
      @entry.date = Date.strptime(params[:date], "%Y-%m-%d") rescue nil
    end
  
    if @entry.save
      redirect_to "/places/#{@place["id"]}"
    else
      render "new"
    end
  end

  private

  def entry_params
    params.permit(:title, :date)
  end

end
