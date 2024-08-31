# frozen_string_literal: true

json.post do
  json.array! @posts do |post|
    json.partial! 'posts/post', post: post, user: @user # rubocop:disable Style/HashSyntax: Omit the hash value.
  end
end
json.pagination_data do
  json.current_page   @posts.current_page
  json.per_page       @posts.limit_value
  json.total_pages    @posts.total_pages
  json.total_count    @posts.total_count
end
