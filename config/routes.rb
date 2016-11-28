Rails.application.routes.draw do

  root  'home#index'

  get   'about'     =>  'home#about'
  get   'calendar'  =>  'home#calendar'
  get   'home'      =>  'home#index'
  get   'wiki'      =>  'home#wiki'

  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    mailer: 'users/mailer',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    shared: 'users/shared',
    unlocks: 'users/unlocks'
  }

  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'
  
  resources :input_data
  resources :input_types
  resources :items
  resources :parts
  resources :assessment_types
  resources :years do
    resources :assessment_types do
      resources :templates, only: [:index] do
        resources :forms, only: [:index] do
          resources :parts, only: [:index]
        end
      end
    end
  end
  resources :templates, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :forms, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :parts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :faqs

end
