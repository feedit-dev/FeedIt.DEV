Rails.application.routes.draw do
  root to: "feeds#index", defaults: { format: 'xml' }
  resources :feeds, defaults: { format: 'xml' }
end
