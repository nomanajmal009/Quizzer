require 'rails_helper'

RSpec.describe 'Tests Api', type: :request do
    describe 'GET /api/v1/list_of_tests' do
        before do
            FactoryBot.create_list(:test, 10, :skip_validate)
            @user = FactoryBot.create(:user)
            sign_in(@user)
        end

        context 'with valid authorize token'

            it 'returns all posts' do
                get '/api/v1/list_of_tests', headers: {"authorization" => @user.api_token}
                expect(JSON.parse(response.body).size).to eq(10)
            end

        context 'with invalid authorize token'

            it 'returns unauthorize user error' do
                get '/api/v1/list_of_tests', headers: {"authorization" => 'InvalidToken'}
                expect(JSON.parse(response.body)['error']).to eq('User not authenticated')
            end
    end

    describe 'GET /api/v1/test' do
        before do
            @test = FactoryBot.create(:test, :skip_validate)
            @user = FactoryBot.create(:user)
            sign_in(@user)
        end

        context 'with valid authorize token'
            it 'returns all posts' do
                get "/api/v1/test/#{@test.id}", headers: {"authorization" => @user.api_token}
                expect(JSON.parse(response.body).size).to eq(1)
            end

        context 'with invalid authorize token'
            it 'returns all posts' do
                get "/api/v1/test/#{@test.id}", headers: {"authorization" => 'InvalidToken'}
                expect(JSON.parse(response.body)['error']).to eq('User not authenticated')
            end

  end
end