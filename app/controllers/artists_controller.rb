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
      format.html { render partial: 'artists/news' }
      format.js { render partial: 'artists/news', locals: { artist: @artist } }
    end
  end

  def photos
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html { render partial: 'artists/photos' }
      format.js { render partial: 'artists/photos', locals: { artist: @artist } }
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
