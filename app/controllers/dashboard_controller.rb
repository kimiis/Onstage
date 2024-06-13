class DashboardController < ApplicationController
  def dashboard
    # recupere les 3 meilleur stages
    @best_stages = Stage.all.take(5)
    @last_ads = Booking.last_ads
    # raise

    @artist = Artist.find_by(user: current_user) if current_user.artist?
    @artist_id = @artist.id if current_user.artist?

    # @stage = Stage.find_by(user: current_user)
    # @stage_id = @stage.id

    @query = params[:query]
    @artists = Artist.where('name ILIKE ?', "%#{@query}%") || []
    @stages = Stage.where('name ILIKE ?', "%#{@query}%") || []
    @artist_ads = ArtistAd.where('content ILIKE ?', "%#{@query}%") || []
    @stage_ads = StageAd.where('content ILIKE ?', "%#{@query}%") || []
  end
end
