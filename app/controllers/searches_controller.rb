class SearchesController < ApplicationController
  def search
    @query = params[:query]
    @artists = Artist.where('name ILIKE ?', "%#{@query}%") || []
    @stages = Stage.where('name ILIKE ?', "%#{@query}%") || []
    @artist_ads = ArtistAd.where('content ILIKE ?', "%#{@query}%") || []
    @stage_ads = StageAd.where('content ILIKE ?', "%#{@query}%") || []
  end
end
