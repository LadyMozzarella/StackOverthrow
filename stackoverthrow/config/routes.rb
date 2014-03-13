Stackoverthrow::Application.routes.draw do
  root :to => "questions#index"
  resources :questions, :only => [:new, :create]
end
