Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  get 'comments/create'

  get 'comments/destroy'

  post '/tinymce_assets' => 'tinymce_assets#create'

  devise_for :users
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get 'home/index'

  get 'home/about'

  get 'home/members'

  get 'home/recruit'

  get 'search' => "posts#search", as: 'search'

  get 'home/result'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
