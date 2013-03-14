Msclark::Application.routes.draw do
  root to: "home#index"

  resources :courses
  resources :teachers
  resources :students
  get "fake_data" => "home#fake_data"
end
