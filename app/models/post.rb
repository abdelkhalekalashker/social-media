# frozen_string_literal: true

# This is a post model

class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
