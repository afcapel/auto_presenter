Rails.application.routes.draw do

  resources :tasks

  resources :projects

  root 'projects#index'

  resources :projects do
    resources :tasks
  end
end
