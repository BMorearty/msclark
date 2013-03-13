Msclark::Application.routes.draw do
  resources :teachers

  resources :students

  root to: "home#index"
end
