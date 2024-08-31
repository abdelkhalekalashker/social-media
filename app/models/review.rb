# frozen_string_literal: true

# this is review model
class Review < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :update_post_average_rate

  def update_post_average_rate
    post = Post.find(post_id)
    # this can be created using counter cache
    reviews_stars = Review.where(post_id: post_id).pluck(:stars)
    post.update_column(:average_rate, (reviews_stars.sum / reviews_stars.size).round(2))
  end
end
