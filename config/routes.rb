Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  resources :users,  only: [:show]

  resources :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy] do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
