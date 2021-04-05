class ApplicationController < ActionController::Base
  before_action :authenticate_token#, :delete_expired_token, :current_user, :active_user, :user_email_verified



  def authenticate_token
    @auth_token = AuthToken.find_by(token: request.headers['Authorization'])
    render json: { error: 'Invalid token' }, status: :unauthorized unless @auth_token.present?
  end

end
