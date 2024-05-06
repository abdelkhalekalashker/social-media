Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :reviews, only:[:new, :create, :update, :destroy, :index]
  end

  resources :users do
    resources :posts, only: [:index]
  end

  get "top_posts", to: "posts#top_posts"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
