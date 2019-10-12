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
    "icon" => "fas fa-hiking",
    "description" => "Escape game, is a subgenre of point-and-click adventure game which requires a player to escape from imprisonment by exploiting their surroundings.",
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
    "icon" => "fas fa-utensils",
    "description" => "Wine tasting is the sensory examination and evaluation of wine. While the practice of wine tasting is as ancient as its production, a more formalized methodology has slowly become established from the 14th century onwards.",
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
    "icon" => "far fa-futbol",
    "description" => "Rugby, is a contact team sport which originated in England in the first half of the 19th century. One of the two codes of rugby football, it is based on running with the ball in hand.",
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
    "icon" => "far fa-futbol",
    "description" => "Karting is a variant of motorsport road racing with open-wheel, four-wheeled vehicles known as go-karts or shifter karts. They are usually raced on scaled-down circuits.",
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
    "icon" => "fas fa-book",
    "description" => "Karaoke is a way of dining interactive entertainment or video game developed in Japan in which an amateur singer sings along with recorded music (a music video) using a microphone.",
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
    "icon" => "fas fa-book",
    "description" => "Pole dance combines dance and acrobatics centered on a vertical pole. This performance art form takes place not only in gentleman's clubs as erotic dance, but has also recently gained popularity as a mainstream form of fitness, practiced by many enthusiasts in gyms and in dedicated dance studios.",
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
    "icon" => "fas fa-hiking",
    "description" => "Best way to end the week, or the day, apéro comes from the south of France and is now a global story.",
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
