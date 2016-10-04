Rails.application.routes.draw do

  resources :input_data
  resources :input_types
  resources :items
  resources :parts
  resources :assessment_units
  resources :assessment_subtypes
  resources :assessment_types
  root  'home#index'

  get   'calendar'  =>  'home#calendar'
  get   'contact'   =>  'home#contact'

end
