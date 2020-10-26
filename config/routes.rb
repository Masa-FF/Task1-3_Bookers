Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources  :users, only: [:index, :show, :create, :edit, :update]
  resources :books#, only: [:new, :create, :index, :show]
  
  get 'home/about' => 'home#about'
  
  # patch 'users/:id' => 'users#update', as: 'update_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
