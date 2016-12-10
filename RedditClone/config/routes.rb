Rails.application.routes.draw do
  resources :users
  resource :session
  resources :subs
  resources :posts
  resources :comments

end
