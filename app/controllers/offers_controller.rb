class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy ]

  # GET /offers or /offers.json
  def index
    @offers = Offer.all
    render json: @offers
  end

  # GET /offers/1 or /offers/1.json
  def show
    render json: @offer
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    render json: @offer
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully created." }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to offer_url(@offer), notice: "Offer was successfully updated." }
        format.json { render json: @offer, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url, notice: "Offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:price, :status, :user_id, :listing_id)
    end
end
