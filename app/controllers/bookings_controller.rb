class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update]

  def index
    @bookings = Booking.includes(:artist)
    @stage = Stage.includes(:bookings)
    @user = current_user
  end

  def show
  end

  def create
    @stage = Stage.find(params[:stage_id])
    @booking = Booking.new(booking_params)
    @booking.stage = @stage

    if @booking.save
      redirect_to stage_path(@stage)
    else
      render 'stages/show', status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end


  # def cancel
  #   if @booking.update(status: "cancelled")
  #     # booking annulé avec succès
  #   else
  #     # gestion des erreurs
  #   end
  # end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
