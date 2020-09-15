Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  resources :bills
  resources :areas

  resources :areas do 
    resources :tasks, only: [ :new, :create, :update ]

  end
  root to: 'pages#home'

  resources :flats
  resources :chatroom
  resources :chatroom do
    resources :messages
  end

  resources :events

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
