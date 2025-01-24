Rails.application.routes.draw do
  # resources :performance
  root controller: "front_page", action: :index
  get 'performance/start', controller: "performance", action: :start
  get '/performance/tutorial', controller: "performance", action: :tutorial
  get '/performance', controller: "performance", action: :index
  post '/performance/submit', controller: "performance", action: :submit
  get '/performance/success', controller: "performance", action: :success
  get '/performance/fail', controller: "performance", action: :fail
  get '/performance/complete', controller: "performance", action: :complete
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
