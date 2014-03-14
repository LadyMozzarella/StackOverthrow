Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions, :only => [:new, :create, :show, :destroy, :edit]

  resources :users, only: [:show, :create, :new, :edit, :update]

end
