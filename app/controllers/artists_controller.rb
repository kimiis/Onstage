class ArtistsController < ApplicationController
 before_action :set_artist, only: [:show, :news, :photos, :plannings, :aboutUs]
  def index
    @artists = Artist.all
  end

  def show
    @bookings = @artist.bookings
  end

  def news
    @ads = Ad.all
    respond_to do |format|
      format.html { render partial: 'artists/news' }
      format.js { render partial: 'artists/news', locals: { artist: @artist } }
    end
  end

  def photos
    
    respond_to do |format|
      format.html { render partial: 'artists/photos' }
      format.js { render partial: 'artists/photos', locals: { artist: @artist } }
    end
  end

  def plannings
    respond_to do |format|
      format.html { render partial: 'artists/plannings' }
      format.js { render partial: 'artists/plannings', locals: { artist: @artist } }
    end
  end

  def aboutUs
    respond_to do |format|
      format.html { render partial: 'artists/aboutUs' }
      format.js { render partial: 'artists/aboutUs', locals: { artist: @artist } }
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
    params.require(:artist).permit(:name, :address, :phone_number, :photos[], :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
