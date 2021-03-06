class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offers = policy_scope(Offer)
    if params[:category]
      @offers = Offer.where(category: params[:category])
    elsif params[:query].present?
      sql_query = " \
        offers.name ILIKE :query \
        OR offers.category ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
        Or offers.address ILIKE :query \
      "
      @offers = Offer.joins(:user).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save
      redirect_to offers_path
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    authorize @offer
    redirect_to dashboard_path
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    authorize @offer
    redirect_to dashboard_path
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :category, :description, :user_id, :photo, :address)
  end
end
