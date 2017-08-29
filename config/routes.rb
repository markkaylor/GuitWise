Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"

  devise_scope :user do
    root to: 'pages#home'

    resources :users,  only: [:show] do
      resources :follows, only: [ :create ]
    end

    resources :follows, only: [ :destroy ]

    resources :posts, only: [ :new, :create, :index, :show ] do
      resources :comments, only: [:new, :create ]

      member do
        post 'upvote'
        post 'downvote'
      end
    end

    resources :comments, only: [] do
      member do
        post 'upvote'
        post 'downvote'
      end
    end
  end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [ :create ]
    end
  end
end
