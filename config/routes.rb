Rails.application.routes.draw do
  # Homepage has commands you can use in app
  root to: "landing#home", defaults: { format: 'html' }

  # Core route used to enter commands
  resources :feeds, defaults: { format: 'xml' }

  # Quick access route for easier URL entry by customers
  get '/f', controller: 'feeds', action: 'index', defaults: { format: 'xml' }
end
