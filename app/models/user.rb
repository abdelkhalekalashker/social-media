# frozen_string_literal: true

# user model
class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
