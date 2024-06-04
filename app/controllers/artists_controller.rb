class ArtistsController < ApplicationController
 before_action :set_artist, only: [:show]
  def index
    @artists = Artist.all
  end

  def show
    @bookings = @artist.bookings
  end

  def news
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html { render partial: 'news' }
      format.js
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :address, :phone_number)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
