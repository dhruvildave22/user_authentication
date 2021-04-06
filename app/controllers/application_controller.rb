class ApplicationController < ActionController::Base
  before_action :authenticate_token, :delete_expired_token, :current_user, #:active_user, :user_email_verified



  def authenticate_token
    @auth_token = AuthToken.find_by(token: request.headers['Authorization'])
    render json: { error: 'Invalid token' }, status: :unauthorized unless @auth_token.present?
  end

  def delete_expired_token
    return unless @auth_token.expired?

    @auth_token.delete
    render json: { error: 'Token expired' }, status: :unauthorized
  end

  def current_user
    Current.user = AuthToken.find_by(token: request.headers['Authorization']).user
  end

  # Use this to indetify diffrent type of roles of current user
  # before_action 

  # private

  # def authorize!
  #   raise Errors::UnauthorizedErrorHandler::UserIsNotAuthorized unless Current.user.role == 'admin'
  # end
end
