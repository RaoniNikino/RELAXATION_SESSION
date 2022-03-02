class DashboardController < ApplicationController
  def dashboard
     @bookings = Booking.where(user_id:"#{current_user.id}")
  end
end
