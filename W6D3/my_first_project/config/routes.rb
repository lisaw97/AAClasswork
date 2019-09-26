Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  # get 'users', to: 'users#index', as: 'users'
  # get 'users/new', to: 'users#new', as: 'new_user' # HTML
  # post 'users', to: 'users#create'
  # get 'users/:id', to: 'users#show', as: 'user3'
  # get 'users/:id/edit', to: 'users#edit', as: 'user4'
  # patch 'users/:id', to: 'users#update', as: 'user5'
  # put 'users/:id', to: 'users#update', as: 'user6'
  # delete 'users/:id', to: 'users#destroy', as: 'user7'
end
