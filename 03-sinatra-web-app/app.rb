require "sinatra"
require "sinatra/link_header"
require "sinatra/reloader" if development?

enable :static

CATEGORIES = ["Adventure", "Sport", "Visits", "Workshops", "Cultural", "Food"]

ACTIVITIES = [
  {
    "id" => 0,
    "name" => "Escape Game",
    "category" => CATEGORIES[0].upcase,
    "city" => "Nantes",
    "duration" => 60,
    "participants" => 4,
    "price" => 120,
    "image" => "https://cdn.futura-sciences.com/buildsv6/images/wide1920/9/d/e/9de5f7181a_126842_lobby-1-c-escape-hunt-nantes.jpg"
    },
    {
    "id" => 1,
    "name" => "Wine Tasting",
    "category" => CATEGORIES[5].upcase,
    "city" => "Paris",
    "duration" => 90,
    "participants" => 15,
    "price" => 300,
    "image" => "https://img.mshanken.com/d/wso/Articles/2019/IQ_HowToTasting_1600.jpg"
    },
    {
    "id" => 2,
    "name" => "Rugby",
    "category" => CATEGORIES[1].upcase,
    "city" => "Marseille",
    "duration" => 80,
    "participants" => 46,
    "price" => 200,
    "image" => "http://www.leparisien.fr/resizer/xHNPY1i61PTOV_5soJFe6NyRy7E=/932x582/arc-anglerfish-eu-central-1-prod-leparisien.s3.amazonaws.com/public/GD2F7SAOD3Z3QAVR2GQSZKSLZI.jpg"
    },
    {
    "id" => 3,
    "name" => "Karting",
    "category" => CATEGORIES[1].upcase,
    "city" => "Nice",
    "duration" => 120,
    "participants" => 10,
    "price" => 300,
    "image" => "https://images.caradisiac.com/images/4/5/9/9/174599/S0-test-kartkraft-le-simulateur-de-karting-pour-fanatiques-582283.jpg"
    },
    {
    "id" => 4,
    "name" => "Karaoke",
    "category" => CATEGORIES[4].upcase,
    "city" => "Tokyo",
    "duration" => 120,
    "participants" => 100,
    "price" => 600,
    "image" => "http://goolfy-montpellier.com/wp-content/uploads/2018/06/karaoke.jpg"
    },
    {
    "id" => 5,
    "name" => "Pole Dance",
    "category" => CATEGORIES[4].upcase,
    "city" => "Rennes",
    "duration" => 60,
    "participants" => 5,
    "price" => 300,
    "image" => "https://img.grouponcdn.com/deal/e27py5JFcfDuLHZi137xD3qNZCk/e2-700x420/v1/c700x420.jpg"
    },
    {
    "id" => 6,
    "name" => "Apéro",
    "category" => CATEGORIES[0].upcase,
    "city" => "Marseille",
    "duration" => 300,
    "participants" => 1000,
    "price" => 10000,
    "image" => "https://www.cherbougetoi.com/wp-content/uploads/2017/04/beerz-apero.jpg"
    }
  ]

get "/" do

@activities = ACTIVITIES

  erb :index

end

get "/activities/:id" do
  @activity = ACTIVITIES.find { |activity| activity["id"] == params["id"].to_i }

  erb :activity
end
