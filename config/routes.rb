Rails.application.routes.draw do
  resources :muscle_groups
  resources :exercises
  resources :exercise_types
  resources :workouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
