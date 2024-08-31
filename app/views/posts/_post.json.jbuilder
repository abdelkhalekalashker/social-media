# frozen_string_literal: true

json.id       post.id
json.title    post.title
json.body     post.body

json.user do
  json.user_id    user.id
  json.user_name  user.name
end
