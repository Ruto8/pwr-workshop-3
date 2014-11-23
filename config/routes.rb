Rails.application.routes.draw do

  namespace :api do
    resources :digs
  	post '/digs/:id/vote', to: 'digs#vote'
  end

  get 'api' => proc { [404, {}, ['Invalid API endpoint']] }
  get 'api/*path' => proc { [404, {}, ['Invalid API endpoint']] }

  root 'home#index'
  get '*path', to: 'home#index'
end

