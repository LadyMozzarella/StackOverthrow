Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions do
    resources :answers, only: [:new, :create]
  end

  resources :users, only: [:show, :create, :new]

end
