Rails.application.routes.draw do
  devise_for :users , controllers: {
    sessions: 'users/sessions',
    regisrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root 'application#home'
  get 'questions/possible_answers', to: 'questions#possible_answers'
  post 'questions/possible_answers', to: 'questions#possible_answers_submit'

  resources :surveys
  resources :questions
  resources :answers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
