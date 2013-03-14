Msclark::Application.routes.draw do
  resources :courses

  resources :teachers

  resources :students

  root to: "home#index"
end
