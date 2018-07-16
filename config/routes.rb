Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get 'home/index'

  get 'home/about'

  get 'home/members'

  get 'home/recruit'

  get 'home/result'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
