# frozen_string_literal: true

json.extract! review, :id, :post_id, :user_id, :content, :created_at, :updated_at
# json.url review_url(review, format: :json)
