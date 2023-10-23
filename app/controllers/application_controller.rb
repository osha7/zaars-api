class ApplicationController < ActionController::Base
  respond_to :html, :json
  skip_before_action :verify_authenticity_token, if: :json_request?
  # MOVE THIS TO NECESSARY CONTROLLERS:
  # before_action :authenticate_user!

  # TODO: # do I remove this next line in lieu of the line after it?
  # before_action :authenticate_user!, unless: :json_request?
  # before_action :authenticate_user_from_token!, if: :json_request?

  # Whitelist additional attributes as things that we will allow users to modify about themselves
  before_action :configure_permitted_parameters, if: :devise_controller?

  # acts_as_token_authentication_handler_for User,
  #     if: ->(controller) { controller.user_token_authenticable? }

  protected

  # add the name of each column you want users to be able to modify to the respective array of symbols
  def configure_permitted_parameters
    attributes = [:username, :email, :password, :first_name, :last_name, :street_address, :street_address_2, :city, :state, :zip, :country, :phone_number, :private, :facebook, :instagram, :twitter, :seller_account, :follows_count, :reviews_count, :stripe_account_id]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def json_request?
    request.format.json?
  end

  def authenticate_user_from_token!
    user_token = params[:user_token]
    user = user_token && User.find_by_authentication_token(user_token)

    if user
      # This lets us use current_user for JSON requests
      sign_in user, store: false
    end
  end
end
