json.extract! movie, :id, :jp_title, :en_title, :image, :cast, :director, :scriptwriter, :playyear, :country, :imdb, :created_at, :updated_at
json.url movie_url(movie, format: :json)
