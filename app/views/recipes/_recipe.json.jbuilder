json.extract! recipe, :id, :name, :preparation_time_seconds, :cooking_time_seconds, :description, :public, :user_id,
              :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
