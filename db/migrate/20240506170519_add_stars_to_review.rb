# frozen_string_literal: true

#  add stars to reviews table
class AddStarsToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :stars, :integer, default: 0
  end
end
