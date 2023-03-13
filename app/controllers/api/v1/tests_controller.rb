class Api::V1::TestsController < ApplicationController
  protect_from_forgery with: :null_session  
  before_action :authenticate_user

  def list_of_tests
    @tests = Test.all
  end

  def test
    @test = Test.find(params[:id])
  end

  def save_test
    # Stub this one
  end

  private

    def authenticate_user
      api_token = request.headers['authorization']&.split(' ')&.last
      user = User.find_by_api_token(api_token)
      return if user

      render json: { error: 'User not authenticated' }.to_json and return
    end
end
