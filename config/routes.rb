Rails.application.routes.draw do

  get 'home/about'
  devise_for :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>'users#top'

  resources :users,only: [:index,:show,:edit,:update]

  resources :books
end
