class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :destroy, :update]

  def index
    # @artist_ads = ArtistAd.includes(:artist_ads)
    # @stage_ads = StageAd.includes(:stage_ads)
    @artist_ads = ArtistAd.all
    @stage_ads = StageAd.all
  end

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

  def new_artist_ad
    @ad = ArtistAd.new
    render 'new_artist_ad'
  end

  def create_artist_ad
    @ad = ArtistAd.new(artist_ad_params)
    @artist = Artist.find_by(user: current_user)
    @ad.artist_id = @artist.id
    if @ad.save
      redirect_to dashboard_path, notice: 'Artist ad was successfully created.'
    else
      render :new_artist_ad, status: :unprocessable_entity
    end
  end

  def new_stage_ad
    @ad = StageAd.new
    render 'new_stage_ad'
  end

  def create_stage_ad
    @ad = StageAd.new(stage_ad_params)
    @ad.user = current_user

    if @ad.save
      redirect_to dashboard_path, notice: 'Stage ad was successfully created.'
    else
      render :new_stage_ad
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

  def artist_ad_params
    params.require(:artist_ad).permit(:content, :photo)
  end

  def stage_ad_params
    params.require(:stage_ad).permit(:content, :photo)
  end

  def ad_params
    if @ad.is_a?(ArtistAd)
      artist_ad_params
    elsif @ad.is_a?(StageAd)
      stage_ad_params
    else
      raise "Unknown ad type"
    end
  end

  def set_ad
    @ad = ArtistAd.find_by(id: params[:id]) || StageAd.find_by(id: params[:id])
  end



end
