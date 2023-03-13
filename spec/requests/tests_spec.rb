require 'rails_helper'

RSpec.describe 'Tests Api', type: :request do
  describe 'GET /api/v1/list_of_tests' do
    context 'with valid authorize token'
        before do
            tests = FactoryBot.create_list(:test, 10)
            user = FactoryBot.create(:user)
            sign_in(user)
            get '/api/v1/list_of_tests', headers: {"authorization" => user.api_token}
        end
        
        it 'returns all posts' do
            expect(JSON.parse(response.body).size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
  end
end