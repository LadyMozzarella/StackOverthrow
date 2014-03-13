Stackoverthrow::Application.routes.draw do
  resources :questions, :only => [:new]
end
