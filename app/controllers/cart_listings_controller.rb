class CartListingsController < ApplicationController
  before_action :set_cart_listing, only: %i[ show edit update destroy ]

  # GET /cart_listings or /cart_listings.json
  def index
    @cart_listings = CartListing.all
  end

  # GET /cart_listings/1 or /cart_listings/1.json
  def show
  end

  # GET /cart_listings/new
  def new
    @cart_listing = CartListing.new
  end

  # GET /cart_listings/1/edit
  def edit
  end

  # POST /cart_listings or /cart_listings.json
  def create
    @cart_listing = CartListing.new(cart_listing_params)

    respond_to do |format|
      if @cart_listing.save
        format.html { redirect_to cart_listing_url(@cart_listing), notice: "Cart listing was successfully created." }
        format.json { render :show, status: :created, location: @cart_listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_listings/1 or /cart_listings/1.json
  def update
    respond_to do |format|
      if @cart_listing.update(cart_listing_params)
        format.html { redirect_to cart_listing_url(@cart_listing), notice: "Cart listing was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_listings/1 or /cart_listings/1.json
  def destroy
    @cart_listing.destroy

    respond_to do |format|
      format.html { redirect_to cart_listings_url, notice: "Cart listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_listing
      @cart_listing = CartListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_listing_params
      params.fetch(:cart_listing, {})
    end
end
