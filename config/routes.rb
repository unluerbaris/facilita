Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update] do
    resources :messages, only: [:create] do
      member do
        put "like" =>"messages#upvote"
      end
    end
    resources :questions, only: [:create] do
      member do
        put "like" =>"questions#upvote"
      end
    end
    resources :polls, only: [:show, :new, :create]
    resources :feedbacks, only: [:new, :create]
    get 'summary', to: 'events#summary'
  end
  resources :audiences, only: [:create]
  resources :choices, only: [:create, :new]
  resources :responses, only: [:create]
end
