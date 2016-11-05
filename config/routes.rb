Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'

  resources :input_data
  resources :input_types
  resources :items
  resources :parts
  resources :assessment_units
  resources :assessment_subtypes
  resources :assessment_types
  resources :years do
    resources :assessment_types do
      resources :assessment_subtypes, only: [:index] do
        resources :assessment_units, only: [:index] do
          resources :parts, only: [:index]
        end
      end
    end
    resources :assessment_subtypes, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :assessment_units, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :parts, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  root  'home#index'

  get   'about'     =>  'home#about'
  get   'calendar'  =>  'home#calendar'
  get   'contact'   =>  'home#contact'
  get   'home'      => 'home#index'
  get   'faqs'      => 'home#faqs'
  get   'wiki'      => 'home#wiki'
end
