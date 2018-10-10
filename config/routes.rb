Rails.application.routes.draw do
  resources :uploads
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
end
