# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(name: 'Abdelkhalek')
posts = []
50_000.times do |i|
  post = Post.new(user:, title: "Hello#{i}", body: "This is th body of Hello post of #{i}")
  posts << post
end

Post.import(posts)

post = Post.new(user:, title: 'Hello again', body: 'This is th body of Hello post')
reviews = []
20_000.times do |_i|
  review = Review.new(user:, post:, content: 'review content', stars: 3)
  reviews << review
end

Review.import(reviews)
