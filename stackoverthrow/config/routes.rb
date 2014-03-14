Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions

  resources :users, only: [:show, :create, :new, :destroy]
end
