Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'
  resources :answers, only: [:create]
  resources :users, only: %i[create new]
  resources :quizzes, only: [:index] do
    get 'result', on: :collection
  end
end
