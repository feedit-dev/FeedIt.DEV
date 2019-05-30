Rails.application.routes.draw do
  # Homepage has commands you can use in app
  root to: "landing#home", defaults: { format: 'html' }
  get '/how_this_works', to: 'landing#how_this_works', defaults: { format: 'html' }
  get '/xml', to: 'landing#xml', defaults: { format: 'html'}
  get '/json', to: 'landing#json', defaults: { format: 'html' }
  get '/saved_queries', to: 'landing#saved_queries', defaults: { forat: 'html' }
  get '/admin', to: 'landing#xml', defaults: { format: 'html' }

  # Core route used to enter commands
  resources :feeds, defaults: { format: 'xml' }

  # Quick access route for XML easier URL entry by customers
  get '/f', controller: 'feeds', action: 'index', defaults: { format: 'xml' }

  # Quick access routes for JSON easier URL entry by customers
  get '/j', controller: 'json', action: 'index', defaults: { format: 'json' }
end
