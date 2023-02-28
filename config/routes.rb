Rails.application.routes.draw do
  devise_for :users ,path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "users#index"
  
  # match 'api/v1/test' => 'tests#test', :via => :get
  # match 'api/v1/list_of_test' => 'tests#test', :via => :get
  # match '/login' => 'users#login', :via => :get
  # match '/logout' => 'users#me', :via => :post

  
  resources :tests
  resources :users 

  namespace :api do
    namespace :v1 do
      get '/test/:id' => 'tests#test'
      post '/save_test' => 'tests#save_test'
      get '/list_of_tests' => 'tests#list_of_tests'
      get '/login' => 'authentication#login'
      post '/logout' => 'authentication#logout'
    end
  end

  
end
