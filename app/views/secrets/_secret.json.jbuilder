json.extract! secret, :id, :application_environment_id, :key, :value, :created_at, :updated_at
json.url secret_url(secret, format: :json)