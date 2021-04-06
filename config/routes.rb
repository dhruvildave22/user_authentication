Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v2' do
      post '/login',    to: 'sessions#login'
      delete '/logout',   to: 'sessions#logout'
      put '/forgot_password', to: 'sessions#forgot_password'
      put '/users/:reset_password_token/reset_password', to: 'users#reset_password'

      resources :users
    end
  end
end
