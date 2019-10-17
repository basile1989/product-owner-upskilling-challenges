require "sinatra"
require "sinatra/json"
require "sinatra/link_header"
require "sinatra/namespace"
require "sinatra/reloader" if development?

require "sqlite3"

enable :static

DB_PATH = File.join(__dir__, "db/team_building.sqlite")
DB      = SQLite3::Database.new(DB_PATH)
DB.results_as_hash = true

get "/" do
  json "name" => "Team Building API", "status" => "Running"
end



namespace "/v1" do
  # TODO: your code goes here
  get "/activities" do
    activities = DB.execute("SELECT * FROM activities;")
    json "activities" => activities
  end
  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities where id = #{params["id"]};")
    json "activity" => activity

  end
end



namespace "/v2" do
  # TODO: your code goes here

  get "/activities" do


    if params["city"] != nil
      city_query = "upper(city) = upper(\"#{params["city"]}\")"
      filter = "where"
    end

    if params["category"] != nil
      category_query = "upper(category) = upper(\"#{params["category"]}\")"
      filter = "where"
    end

    if params["search"] != nil
      name_query = "name LIKE \"%#{params["search"]}%\" "
      filter = "where"
    end


    if params["search"] == nil && params["category"] == nil && params["city"] == nil
      filter = ""
    end

    query = [city_query, category_query, name_query].compact.join(" and ")
    activities = DB.execute("SELECT * FROM activities #{filter} #{query};")
    json "activities" => activities


  end
  get "/activities/:id" do
    activity = DB.execute("SELECT * FROM activities where id = #{params["id"]};")
    json "activity" => activity

  end
end




namespace "/doc" do
  get { erb :"doc/index" }

  namespace "/v1" do
    get "/activities" do
      erb :"doc/v1/activities"
    end
  end

  namespace "/v2" do
    get "/activities" do
      erb :"doc/v2/activities"
    end
  end
end
