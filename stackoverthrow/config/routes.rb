Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions do
    resources :answers, except: [:index, :show]
  end

  resources :users, only: [:show, :create, :new, :destroy]
end
