json.extract! team, :id, :name, :description, :photo, :created_at, :updated_at
json.url team_url(team, format: :json)
