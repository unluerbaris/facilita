Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update] do
    resources :messages, only: [:create]
    resources :questions, only: [:create]
    resources :polls, only: [:new, :create] do
      resources :choices, only: [:create]
    end
    get 'summary', to: 'events#summary'
  end
  resources :audiences, only: [:create]
end
