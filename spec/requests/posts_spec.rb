require "rails_helper"

RSpec.describe '/posts', type: :request do
  let(:user) { User.create(name: "Abdo")}
  let(:post) { Post.create(user: user, title: "Hello again", body: "This is th body of Hello post")}
  describe "Get/ Index posts" do

    it "should return :ok" do
      post
      get "/posts", as: :json
      expect(response).to be_successful
    end
  end

  describe "Get/ top_posts" do
    let(:user_2 ){User.create(name: "jone")}
    let(:post_1 ){Post.create(user: user_2, title: "Another post1", body: "This is th body of Hello post")}
    let(:post_2 ){Post.create(user: user_2, title: "Another post2", body: "This is th body of Hello post")}
    it "should return posts in descending order" do
      review = Review.create(post: post, user: user, stars: 5, content: "This is th content of review")
      get "/top_posts", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)["post"][0]["id"]).to eq(post.id)
      expect(JSON.parse(response.body)["post"][0]["title"]).to eq(post.title)
    end
  end

  context "Get/ Show posts" do

    it "should return return specific post" do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)["id"]).to eq(post.id)
    end

    it "return post should return title in that post" do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)["title"]).to eq("Hello again")
    end

    it "return post should return body in that post" do
      post
      get "/posts/#{post.id}", as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)["body"]).to eq("This is th body of Hello post")
    end
  end

  context "POST Create /posts" do
    it "return post should return body in that post" do
      post_params = {title: "Another post", body: "This is another post", user_id: user.id}
      post "/posts",params: {title: "Another post", body: "This is another post", user_id: user.id}, as: :json
      expect(response).to be_successful
    end
  end

  context "DELETE /posts" do
    it "delete specific post" do
      delete "/posts/#{post.id}", as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
