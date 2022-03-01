class BookingsController < ApplicationController

#we might not in need of all these actions, but at least we need the create, as every new booking will be reflected on the offer's show controle

def index
  @bookings = Booking.all
end

def new
  @booking = Booking.new
end

def create
  @booking = Booking.new(booking_params)
  @booking.save
  redirect_to bookings_path
end

def delete
  @booking = booking.find(params[:id])
  @booking.destroy
end

private

def booking_params
  params.require(:booking).permit(:date, :offer_id, :user_id)
end

end
