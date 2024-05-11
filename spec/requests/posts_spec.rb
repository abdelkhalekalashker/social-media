# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/posts', type: :request do
  let(:user) { User.create(name: 'Abdo') }
  let(:post) { Post.create(user:, title: 'Hello again', body: 'This is th body of Hello post') }
  describe 'Get/ Index posts' do
    it 'should return :ok' do
      post
      get posts_path, as: :json
      expect(response).to be_successful
    end
  end

  context 'GET /user_posts' do
    post_user = User.create(name: 'Doe')
    user_post = Post.create(user: post_user, title: 'unique post', body: 'This is unique post')
    it 'should return all posts of a user' do
      get "/users/#{post_user.id}/user_posts", as: :json
      expect(response).to have_http_status(:ok)
      expect(response).not_to be_nil
      expect(JSON.parse(response.body)['post'].count).to eq(1)
      expect(JSON.parse(response.body)['post'].first['id']).to eq(user_post.id)
    end
  end

  describe 'Get/ top_posts' do
    let(:user_2) { User.create(name: 'jone') }
    let(:post_1) { Post.create(user: user_2, title: 'Another post1', body: 'This is th body of Hello post') }
    let(:post_2) { Post.create(user: user_2, title: 'Another post2', body: 'This is th body of Hello post') }
    it 'should return posts in descending order' do
      Review.create(post:, user:, stars: 5, content: 'This is th content of review')
      get '/top_posts', as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)['post'][0]['id']).to eq(post.id)
      expect(JSON.parse(response.body)['post'][0]['title']).to eq(post.title)
    end
  end

  context 'Get/ Show posts' do
    it 'should return return specific post' do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)['id']).to eq(post.id)
    end

    it 'return post should return title in that post' do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)['title']).to eq('Hello again')
    end

    it 'return post should return body in that post' do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)['body']).to eq('This is th body of Hello post')
    end
  end

  # context "POST Create /posts" do
  #   it "should create a new post" do
  #     user = User.create(name: "jone") # Assuming you have a user factory
  #     post "/posts", params: {"post"=>{"user_id"=>user.id, "title"=>"hello", "body"=>"hello too"}}, as: :json
  #     expect(response).to be_successful
  #   end
  # end

  context 'PATCH /posts' do
    it 'updates specific post' do
      patch "/posts/#{post.id}", params: { post: { body: 'newwwwwww' } }, as: :json
      expect(response).to be_successful
      expect(post.reload.body).to eq('newwwwwww')
    end
  end

  context 'DELETE /posts' do
    it 'delete specific post' do
      delete "/posts/#{post.id}", as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
