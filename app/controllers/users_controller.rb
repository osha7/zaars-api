class UsersController < ApplicationController
  require "stripe"
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # def show
  #     @user = User.find_by!(id: params.fetch(:id))
  #     render json: @user
  # end

  def show
    render json: { user: @user }
  end

  # def create
  #    user = User.create(user_params)
  #    pp user

  #     if user.valid?
  #         user.email = user.email.downcase
  #         user.save

  #         render json: {
  #             status: :created,
  #             user: user,
  #         }
  #     else
  #         render json: {
  #             status: 500,
  #             errors: user.errors.full_messages,
  #         },
  #         status: :not_acceptable
  #     end
  # end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # ------------STRIPE-------------------------------------

  def create_express_account
    Stripe.api_key = "#{ENV.fetch("STRIPE_API_LIVE_KEY")}"
    begin
      account = Stripe::Account.create({
        type: "express",
        country: "US",
        email: "billy@example.com",
        business_type: "individual",
        company: {
          phone: "973-303-8804",
        },
        capabilities: {
          card_payments: { requested: true },
          transfers: { requested: true },
        },
        # business_type: 'company',
        business_profile: {
          product_description: "South asian clothing seller.",
        },
      })
      account_link = Stripe::AccountLink.create({
        account: account.id,
        refresh_url: "https://3000-stephenavocado-zaarsweb-t0jl39kvoly.ws-us105.gitpod.io",
        return_url: "https://3000-stephenavocado-zaarsweb-t0jl39kvoly.ws-us105.gitpod.io",
        type: "account_onboarding",
      })
      render json: { account_id: account.id, account_link_url: account_link.url }
    rescue Stripe::StripeError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def create_account_link
    account_link = Stripe::AccountLink.create({
      account: account.id,
      refresh_url: "https://3000-stephenavocado-zaarsweb-t0jl39kvoly.ws-us105.gitpod.io",
      return_url: "https://3000-stephenavocado-zaarsweb-t0jl39kvoly.ws-us105.gitpod.io",
      type: "account_onboarding",
    })
    return account_link
  end

  def retrieve_express_account
    Stripe.api_key = "#{ENV.fetch("STRIPE_API_TEST_KEY")}"

    begin
      account = Stripe::Account.retrieve("#{ENV.fetch("STRIPE_ACCT")}") # update this later
      render json: { acount: account }
    rescue Stripe::StripeError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # ---------^--STRIPE-^-----------------------------------

  private

  def user_params
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :street_address, :street_address_2, :city, :state, :zip, :country, :phone_number, :facebook, :instagram, :twitter, :seller_account, :private)
  end
end
