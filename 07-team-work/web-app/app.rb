require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static



get "/" do
  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  list = payload["activities"]
  categories = []
  cities = []
  list.each do |activity|
    cities = cities + [activity["city"]]
    categories = categories + [activity["category"]]
  end

  @city_list = cities.uniq
  @category_list = categories.uniq

  erb :index
end





get "/activities/:id" do

  url = "693c90d8.ngrok.io/v2/activities/#{params["id"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activity = payload["activity"]

  url = "693c90d8.ngrok.io/v2/teams"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)

  @teams = payload["teams"]

  url = "693c90d8.ngrok.io/v2/favorites?activity_id=#{params["id"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)

  if payload != nil
  @favorites = payload["favorites"]
  end

  erb :activity
end





get "/activities" do


  url = "693c90d8.ngrok.io/v2/activities?city=#{params["city"]}&category=#{params["category"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  list = payload["activities"]
  categories = []
  cities = []
  list.each do |activity|
    cities = cities + [activity["city"]]
    categories = categories + [activity["category"]]
  end

  @city_list = cities.uniq
  @category_list = categories.uniq



  erb :activity_filtered
end

get "/activities" do


  url = "693c90d8.ngrok.io/v2/activities?search=#{params["name"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  list = payload["activities"]
  categories = []
  cities = []
  list.each do |activity|
    cities = cities + [activity["city"]]
    categories = categories + [activity["category"]]
  end

  @city_list = cities.uniq
  @category_list = categories.uniq



  erb :activity_filtered
end

get "/wishlists" do
  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

  url = "693c90d8.ngrok.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  list = payload["activities"]
  categories = []
  cities = []
  list.each do |activity|
    cities = cities + [activity["city"]]
    categories = categories + [activity["category"]]
  end

  @city_list = cities.uniq
  @category_list = categories.uniq

  erb :wishlists
end


post "/activity/newlike" do

  api_params = {
    "team_id" => params["team_id"] ,
    "activity_id" => params["activity_id"]
  }

  url = "http://693c90d8.ngrok.io/v2/favorites"

  response = RestClient.post(url, api_params)
  wishlist = JSON.parse(response.body)

  redirect to("http://localhost:4567/activities/#{params["activity_id"]}")

end

delete "/remove_from_wishlist" do

  api_params = {
    "team_id" => params["team_id"]
  }

  url = "http://693c90d8.ngrok.io/v2/favorites"

  response = RestClient.post(url, api_params)
  wishlist = JSON.parse(response.body)

end
