Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions do
    resources :answers, except: [:index, :show]
  end

  resources :users, only: [:show, :create, :new, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  resources :questions, only: [:create, :destroy] do
    resources :votes, only: [:create]
    resources :comments, only: [:create, :new]
  end

  resources :answers, only: [:create, :destroy] do
    resources :votes, only: [:create]
    resources :comments, only: [:create, :new]
  end
end
