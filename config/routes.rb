Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :events, only: [:show, :new, :create, :edit, :update] do
    resources :messages, only: [:create]
    resources :questions, only: [:create] do
      member do
        put "like" =>"questions#upvote"
        put "unlike" =>"questions#downvote"
      end
    end
    resources :polls, only: [:new, :create]
    get 'summary', to: 'events#summary'
  end
  resources :audiences, only: [:create]
end
