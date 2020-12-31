Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:registrations]
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: "search_subject"
    post 'answer', to: 'answer#question'
  end

  namespace :users_backoffice do
    get '', to: 'welcome#index'
    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    get 'zip-code', to: 'zip_code#show'
  end

  namespace :admins_backoffice do
    get '', to: 'welcome#index' #dashboard
    resources :admins #admins
    resources :subjects
    resources :questions
  end

  
  get 'welcome/index'
  get 'inicio', to: 'site/welcome#index'
  get 'backoffice', to: 'admins_backoffice/welcome#index'
  root 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
