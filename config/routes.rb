Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources  :users, only: [:index, :show, :create, :edit, :update]
  get 'top' => 'home#top'
  get 'about' => 'home#about'
  get 'books' => 'users#books'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
