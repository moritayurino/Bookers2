Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"
  post 'users' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :create, :update, :destroy, :index]
end