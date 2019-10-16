require "json"
require "rest-client"

require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static



get "/" do
  url = "https://team-building-api.cleverapps.io/v2/activities"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

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

  @city_list = cities.uniq
  @category_list = categories.uniq

  erb :index
end

get "/activities/:id" do

  url = "https://team-building-api.cleverapps.io/v2/activities/#{params["id"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activity = payload["activity"]

  erb :activity
end

get "/activities" do


  url = "https://team-building-api.cleverapps.io/v2/activities?city=#{params["city"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

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

  @city_list = cities.uniq
  @category_list = categories.uniq



  erb :activity_by_city
end


get "/activities" do


  url = "https://team-building-api.cleverapps.io/v2/activities?category=#{params["category"]}"
  response = RestClient.get(url)
  payload = JSON.parse(response.body)
  @activities = payload["activities"]

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

  @city_list = cities.uniq
  @category_list = categories.uniq



  erb :activity_by_category
end
