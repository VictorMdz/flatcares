Rails.application.routes.draw do
  devise_for :users
  resources :areas


  root to: 'pages#home'

  resources :flats do
    resources :bills
    resources :events
    resources :areas do
      resources :tasks, only: [ :new, :create, :update ]
    end
  end
  resources :chatroom
  resources :chatroom do
    resources :messages
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
