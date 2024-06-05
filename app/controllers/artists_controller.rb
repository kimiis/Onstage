class ArtistsController < ApplicationController
 before_action :set_artist, only: [:show, :news, :photos, :plannings, :aboutUs, :edit, :destroy, :update]
  def index
    @artists = Artist.all
  end

  def show
    @bookings = @artist.bookings
    @user = current_user
  end

  def news
    @artist_ads = ArtistAd.all
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
    @bookings = @artist.bookings
    respond_to do |format|
      format.html { render partial: 'artists/plannings' }
      format.js { render partial: 'artists/plannings', locals: { artist: @artist } }
    end
  end

  def aboutUs
    @user = current_user
    respond_to do |format|
      format.html { render partial: 'artists/aboutUs' }
      format.js { render partial: 'artists/aboutUs', locals: { artist: @artist } }
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to(artist_path(@artist))
    else
      render(:show, status: :unprocessable_entity)
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path, notice: 'Artist was successfully deleted.'
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :address, :phone_number, :photos[], :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
