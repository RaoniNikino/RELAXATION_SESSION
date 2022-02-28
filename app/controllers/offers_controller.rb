class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
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
