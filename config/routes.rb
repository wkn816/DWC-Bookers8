Rails.application.routes.draw do
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users,only: [:show,:index,:edit,:update]
  resources :books
end