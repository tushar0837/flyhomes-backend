class ApplicationController < ActionController::Base
    protect_from_forgery

    acts_as_token_authentication_handler_for User

    # protected
    # def authenticate_user!
    #   if user_signed_in?
    #     super
    #   else
    #     render json: {error: 'You need to sign in before continuing'}, status: 401
    #   end
    # end
end