Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }

  notify_to :users

  resources :areas do
    resources :tasks, only: [ :new, :create, :update ]
  end
root to: "pages#home"

  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  resources :flatmembers, only: [:destroy]

  resources :flats do
    get 'members', to: 'flatmembers#invite'
    post 'invitations', to: 'flatmembers#send_invitations'

    resources :bills
    resources :events

    resources :areas do
      resources :tasks
    end
  end

  resources :bills, only: [] do
    resources :payments, only: [:update]
  end

  resources :chatroom do
    resources :messages
  end


  resources :events

  resources :components
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
