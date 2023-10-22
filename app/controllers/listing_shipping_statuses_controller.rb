class ListingShippingStatusesController < ApplicationController
  before_action :set_listing_shipping_status, only: %i[ show edit update destroy ]

  # GET /listing_shipping_statuses or /listing_shipping_statuses.json
  def index
    @listing_shipping_statuses = ListingShippingStatus.all
  end

  # GET /listing_shipping_statuses/1 or /listing_shipping_statuses/1.json
  def show
  end

  # GET /listing_shipping_statuses/new
  def new
    @listing_shipping_status = ListingShippingStatus.new
  end

  # GET /listing_shipping_statuses/1/edit
  def edit
  end

  # POST /listing_shipping_statuses or /listing_shipping_statuses.json
  def create
    @listing_shipping_status = ListingShippingStatus.new(listing_shipping_status_params)

    respond_to do |format|
      if @listing_shipping_status.save
        format.html { redirect_to listing_shipping_status_url(@listing_shipping_status), notice: "Listing shipping status was successfully created." }
        format.json { render :show, status: :created, location: @listing_shipping_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing_shipping_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_shipping_statuses/1 or /listing_shipping_statuses/1.json
  def update
    respond_to do |format|
      if @listing_shipping_status.update(listing_shipping_status_params)
        format.html { redirect_to listing_shipping_status_url(@listing_shipping_status), notice: "Listing shipping status was successfully updated." }
        format.json { render :show, status: :ok, location: @listing_shipping_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing_shipping_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_shipping_statuses/1 or /listing_shipping_statuses/1.json
  def destroy
    @listing_shipping_status.destroy

    respond_to do |format|
      format.html { redirect_to listing_shipping_statuses_url, notice: "Listing shipping status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_shipping_status
      @listing_shipping_status = ListingShippingStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_shipping_status_params
      params.fetch(:listing_shipping_status, {})
    end
end
