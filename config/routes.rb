# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, as: 'posts'

  resources :posts, only: [:show] do
    resources :reviews, only: %i[new create update destroy index]
  end

  resources :users do
    get 'user_posts', to: 'posts#user_posts'
  end

  get 'top_posts', to: 'posts#top_posts'
end
