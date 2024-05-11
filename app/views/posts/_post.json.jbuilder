# frozen_string_literal: true

json.id       post.id
json.title    post.title
json.body     post.body

json.user do
  json.user_id    post.user_id
  json.user_name  post.user.name
end
