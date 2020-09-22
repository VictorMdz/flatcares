Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }

  notify_to :users

  resources :areas, only: [:show, :update, :edit, :destroy] do
    resources :tasks, only: [ :new, :create, :update, :destroy, :edit]
  end

  root to: "pages#home"

  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end

  resources :flatmembers, only: [:destroy]
  resources :chatrooms


  resources :flats do
    get 'members', to: 'flatmembers#invite'
    post 'invitations', to: 'flatmembers#send_invitations'

    resources :users
    resources :bills
    resources :events

    resources :flatmembers, only: :update

    resources :areas do
      resources :tasks
    end

    resources :chatrooms, only: [:index, :show, :new, :create] do
      resources :messages, only: [:create]
    end

  end

  resources :bills, only: [] do
    resources :payments, only: [:update]
  end



  resources :events

  resources :components
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
