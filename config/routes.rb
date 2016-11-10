Rails.application.routes.draw do
  get 'quiz_mode/start_quiz'
  post 'quiz_mode/next'
  get 'quiz_mode/quiz'
  get 'quiz_mode/complete'

  get 'home/index'

  resources :questions
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
