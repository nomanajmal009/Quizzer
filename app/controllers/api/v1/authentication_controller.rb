class Api::V1::AuthenticationController < ApplicationController
  protect_from_forgery with: :null_session  

  def login
    token = Devise.friendly_token
    current_user.api_token = token
    current_user.save

    render json: { user: current_user }.to_json and return
  end

  def logout
    api_token = request.headers['authorization'].split(' ').last
    user = User.find_by_api_token(api_token)

    if user
      sign_out(user)
      user.api_token = ''
      user.save
      render json: { logout: 'User Logged out' }.to_json and return
    else  
      render json: { error: 'User not authenticated' }.to_json and return
    end
  end

end
