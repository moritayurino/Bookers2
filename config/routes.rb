Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  get 'books/new'
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
