class DashboardController < ApplicationController
  def dashboard
    # recupere les 3 meilleur stages
    @best_stages = Booking.best_stages
    @last_ads = Booking.last_ads
    # raise

    @artist = Artist.find_by(user: current_user)

    # @stage = Stage.find_by(user: current_user)
    # @stage_id = @stage.id

    @query = params[:query]
    @artists = Artist.where('name ILIKE ?', "%#{@query}%") || []
    @stages = Stage.where('name ILIKE ?', "%#{@query}%") || []
    @artist_ads = ArtistAd.where('content ILIKE ?', "%#{@query}%") || []
    @stage_ads = StageAd.where('content ILIKE ?', "%#{@query}%") || []
  end
end
