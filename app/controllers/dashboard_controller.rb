class DashboardController < ApplicationController
  def dashboard
    @bookings = Booking.where(user_id:"#{current_user.id}")
    @offers = Offer.where(user_id:"#{current_user.id}")
  end

  def destroy
  end
end
