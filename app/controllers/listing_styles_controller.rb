class ListingStylesController < ApplicationController
  before_action :set_listing_style, only: %i[ show edit update destroy ]

  # GET /listing_styles or /listing_styles.json
  def index
    @listing_styles = ListingStyle.all
    render json: @listing_styles
  end

  # GET /listing_styles/1 or /listing_styles/1.json
  def show
    render json: @listing_style
  end

  # GET /listing_styles/new
  def new
    @listing_style = ListingStyle.new
    render json: @listing_style
  end

  # GET /listing_styles/1/edit
  def edit
  end

  # POST /listing_styles or /listing_styles.json
  def create
    @listing_style = ListingStyle.new(listing_style_params)

    respond_to do |format|
      if @listing_style.save
        format.html { redirect_to listing_style_url(@listing_style), notice: "Listing style was successfully created." }
        format.json { render json: @listing_style, status: :created, location: @listing_style }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_styles/1 or /listing_styles/1.json
  def update
    respond_to do |format|
      if @listing_style.update(listing_style_params)
        format.html { redirect_to listing_style_url(@listing_style), notice: "Listing style was successfully updated." }
        format.json { render json: @listing_style, status: :ok, location: @listing_style }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_styles/1 or /listing_styles/1.json
  def destroy
    @listing_style.destroy

    respond_to do |format|
      format.html { redirect_to listing_styles_url, notice: "Listing style was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_style
      @listing_style = ListingStyle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_style_params
      params.require(:listing_style).permit(:style_id, :listing_id)
    end
end
