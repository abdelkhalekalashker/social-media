Rails.application.routes.draw do
  root "posts#index"

  resources :posts, as: 'posts'

  resources :posts, only: [:show]do
    resources :reviews, only: [:new, :create, :update, :destroy, :index]
  end

  resources :users do
    resources :posts, only: [:index]
  end

  get "top_posts", to: "posts#top_posts"

end
