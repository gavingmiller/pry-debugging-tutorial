DebuggingRails::Application.routes.draw do
  resources :actors

  devise_for :users

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'actors#index'
end
