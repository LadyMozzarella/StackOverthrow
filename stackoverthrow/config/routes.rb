Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions do
    resources :answers, only: [:new, :create, :edit, :update]
  end

  resources :users, only: [:show, :create, :new, :destroy]
end
