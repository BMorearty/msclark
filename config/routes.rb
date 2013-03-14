Msclark::Application.routes.draw do
  root to: "home#index"

  resources :courses
  resources :teachers
  resources :students
  resources :enrollments, only: :create
  get "fake_data" => "home#fake_data"
  get "logout" => "home#logout"
end
