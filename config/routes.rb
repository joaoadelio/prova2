Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations:  'users/registrations'}
  resources :categories
  root 'advertisements#homepage'
  resources :advertisements do
    collection do
      get 'homepage'
      post 'homepage'
    end
  end
end
