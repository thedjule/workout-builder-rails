Rails.application.routes.draw do
  # Home controller routes.
  root   'home#index'
  get    'auth'            => 'home#auth'
  # Get login token from Knock
  post 'user-token' => 'user_token#create'
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

  resources :muscle_groups, path: 'muscle-groups'
  resources :exercises
  resources :exercise_types, path: 'exercise-types'
  resources :workouts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
