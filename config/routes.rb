Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :advertisements
  root 'advertisements#homepage'
  resources :advertisements do
    collection do
      get 'homepage'
      post 'homepage'
    end
  end
end
