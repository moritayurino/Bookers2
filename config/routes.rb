Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :edit, :index]
end