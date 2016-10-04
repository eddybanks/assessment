Rails.application.routes.draw do

  root  'home#index'

  get   'calendar'  =>  'home#calendar'
  get   'contact'   =>  'home#contact'

end
