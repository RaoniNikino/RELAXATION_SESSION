class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = policy_scope(Offer)
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def show
    @offer = Offer.find(params[:id])
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

  private

  def offer_params
    params.require(:offer).permit(:name, :category, :description, :user_id)
  end
end
