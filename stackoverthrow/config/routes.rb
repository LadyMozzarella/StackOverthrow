Stackoverthrow::Application.routes.draw do
  resources :users, only: [:show, :create, :new, :edit, :update]
end
