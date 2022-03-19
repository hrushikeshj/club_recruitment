# frozen_string_literal: true

json.extract! user, :id, :name, :roll_no, :email, :club_id, :created_at, :updated_at
json.url user_url(user, format: :json)
