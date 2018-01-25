Rails.application.routes.draw do
  resources :comments
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :users
  resources :posts
  root "posts#index"
end
