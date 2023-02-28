class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user_with_request_headers
  before_action :authenticate_user!
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def authenticate_user_with_request_headers
    return unless request.path == '/login';
    email = request.headers['email']
    password = request.headers['password']
    if email && password
      user = User.find_by_email(email)
      return unless user && user.valid_password?(password)

      sign_in(user)
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
