Rails.application.routes.draw do
  get 'questions_imports/new'
  get 'questions_imports/create'
  resources :questions
  resources :objective_questions, controller: 'questions', type: 'ObjectiveQuestion'

  resources :subjects do
    resources :chapters
  end

  resources :chapters do
    resources :topics
  end

  resources :topics do
    resources :sub_topics
  end

  resources :sub_topics

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :questions_imports, only: [:new, :create]
end
