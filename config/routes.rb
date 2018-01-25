Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # resources :users
  # resources :comments
  resources :posts do
    resources :comments
  end
  root "posts#index"
end
