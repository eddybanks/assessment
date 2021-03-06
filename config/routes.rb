Rails.application.routes.draw do

  root  'home#index'

  get   'about'     =>  'home#about'
  get   'calendar'  =>  'home#calendar'
  get   'home'      =>  'home#index'
  get   'wiki'      =>  'home#wiki'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users

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
  resources :forms, only: [:new, :create, :show, :edit, :update, :destroy] do
    get :full_form, on: :member
  end
  resources :parts, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :faqs

end
