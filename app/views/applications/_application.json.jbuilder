json.extract! application, :id, :name, :uses_sidekiq, :uses_postgres, :uses_redis, :uses_ldap, :created_at, :updated_at
json.url application_url(application, format: :json)