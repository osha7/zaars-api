class TailoringSizesController < ApplicationController
  before_action :set_tailoring_size, only: %i[ show edit update destroy ]

  # GET /tailoring_sizes or /tailoring_sizes.json
  def index
    @tailoring_sizes = TailoringSize.all
  end

  # GET /tailoring_sizes/1 or /tailoring_sizes/1.json
  def show
  end

  # GET /tailoring_sizes/new
  def new
    @tailoring_size = TailoringSize.new
  end

  # GET /tailoring_sizes/1/edit
  def edit
  end

  # POST /tailoring_sizes or /tailoring_sizes.json
  def create
    @tailoring_size = TailoringSize.new(tailoring_size_params)

    respond_to do |format|
      if @tailoring_size.save
        format.html { redirect_to tailoring_size_url(@tailoring_size), notice: "Tailoring size was successfully created." }
        format.json { render :show, status: :created, location: @tailoring_size }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tailoring_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tailoring_sizes/1 or /tailoring_sizes/1.json
  def update
    respond_to do |format|
      if @tailoring_size.update(tailoring_size_params)
        format.html { redirect_to tailoring_size_url(@tailoring_size), notice: "Tailoring size was successfully updated." }
        format.json { render :show, status: :ok, location: @tailoring_size }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tailoring_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tailoring_sizes/1 or /tailoring_sizes/1.json
  def destroy
    @tailoring_size.destroy

    respond_to do |format|
      format.html { redirect_to tailoring_sizes_url, notice: "Tailoring size was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tailoring_size
      @tailoring_size = TailoringSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tailoring_size_params
      params.fetch(:tailoring_size, {})
    end
end
