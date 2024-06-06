class StagesController < ApplicationController

 before_action :set_stage, only: [:show, :news, :photos, :plannings, :aboutUs, :edit, :destroy, :update]

  def index
    @stages = Stage.includes(:bookings)
  end

  def show
    @bookings = @stage.bookings
  end

  def news
    @stage_ads = StageAd.all
    respond_to do |format|
      format.html { render partial: 'stages/news' }
      format.js { render partial: 'stages/news', locals: { stage: @stage } }
    end
  end

  def photos
    respond_to do |format|
      format.html { render partial: 'stages/photos' }
      format.js { render partial: 'stages/photos', locals: { stage: @stage } }
    end
  end

  def plannings
    @bookings = @stage.bookings
    respond_to do |format|
      format.html { render partial: 'stages/plannings' }
      format.js { render partial: 'stages/plannings', locals: { stage: @stage } }
    end
  end

  def aboutUs
    respond_to do |format|
      format.html { render partial: 'stages/aboutUs' }
      format.js { render partial: 'stages/aboutUs', locals: { stage: @stage } }
    end
  end

  def edit
  end

  def update
    if @stage.update(stage_params)
      redirect_to(stage_path(@stage))
    else
      render(:show, status: :unprocessable_entity)
    end
  end

  def destroy
    @stage.destroy
    redirect_to stages_path, notice: 'Stage was successfully deleted.'
  end

  private

  def stage_params
    params.require(:stage).permit(:name, :address, :phone_number, :photos[], :description)
  end

  def set_stage
    @stage = Stage.find(params[:id])
  end
end
