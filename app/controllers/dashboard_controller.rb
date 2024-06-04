class DashboardController < ApplicationController
  def dashboard
    # recupere les 3 meilleur stages
    @best_stages = Booking.best_stages
    @last_ads = Booking.last_ads
    # raise
  end
end
