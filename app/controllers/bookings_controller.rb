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
  @booking.user = current_user
  @offer = Offer.find(params[:offer_id])
  @booking.offer = @offer
  authorize @booking
  if @booking.save
    redirect_to dashboard_path
  else
    render :new
  end
end

def edit
  @booking = Booking.find(params[:id])
  authorize @booking
end

def update
  @booking = Booking.find(params[:id])
  @booking.update(booking_params)
  authorize @booking
  redirect_to dashboard_path
end

def destroy
  @booking = Booking.find(params[:id])
  @booking.destroy
  authorize @booking
  redirect_to dashboard_path
end

private

def booking_params
  params.require(:booking).permit(:date, :offer_id, :user_id)
end

end
