Rails.application.routes.draw do
  # Homepage has commands you can use in app
  root to: "landing#home", defaults: { format: 'html' }
  get '/admin', to: 'landing#home', defaults: { forrmat: 'html'}

  # Core route used to enter commands
  resources :feeds, defaults: { format: 'xml' }

  # Quick access route for XML easier URL entry by customers
  get '/f', controller: 'feeds', action: 'index', defaults: { format: 'xml' }

  # Quick access routes for JSON easier URL entry by customers
  get '/j', controller: 'json', action: 'index', defaults: { format: 'json' }
end
