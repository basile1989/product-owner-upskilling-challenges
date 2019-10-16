require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static
url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  list = payload["activities"]
  categories = []
  cities = []
  list.each do |activity|
    cities = cities + [activity["city"]]
    categories = categories + [activity["category"]]
  end

  city_list = cities.uniq
  category_list = categories.uniq

  puts city_list
  puts category_list
