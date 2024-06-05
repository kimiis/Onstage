class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :destroy, :update]

  def artist_ads
    @artist_ads = ArtistAd.all
    respond_to do |format|
      format.html { render partial: 'ads/artist_ad' }
      format.js { render partial: 'ads/artist_ad', locals: { artist: @artist } }
    end
  end

  def stage_ads
    @stage_ads = StageAd.all
    respond_to do |format|
      format.html { render partial: 'ads/stage_ad' }
      format.js { render partial: 'ads/stage_ad', locals: { stage: @stage } }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @ad.update(ad_params)
      redirect_to @ad
    else
      render :edit
    end
  end

  def destroy
    @ad.destroy
    redirect_to ads_path, notice: 'Ad was successfully deleted.'
  end

  private

  def ad_params
    params.require(:ad).permit(:content, :photo)
  end

  def set_ad
    @ad = params[:artist_id] ? ArtistAd.find(params[:id]) : StageAd.find(params[:id])
  end
end
