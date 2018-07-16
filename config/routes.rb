Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'home/index'

  get 'home/about'

  get 'home/members'

  get 'home/recruit'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
