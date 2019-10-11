require "json"
require "rest-client"

puts "What is the name of the user you're looking for? (Pleeeeaaase enter the first name first then the last name)"
name = gets.chomp # asks user to type something in the Terminal

name2 = name.split

firstname = name2[0]
lastname = name2[1]

puts "Ok got it! Let's search for that person..."

token = "18afcfb8-697b-4742-b726-418269485cee"
url = "https://wagon.ilucca-demo.net/api/v3/users?firstName=#{firstname}&lastName=#{lastname}&fields=firstName,lastName,mail,jobTitle,department.name"
headers = { "Authorization" => "Lucca application=#{token}" }
response = RestClient.get(url, headers)
payload = JSON.parse(response.body)


puts "#{payload["data"]["items"][0]["firstName"]} #{payload["data"]["items"][0]["lastName"]} (#{payload["data"]["items"][0]["mail"]})"
puts "#{payload["data"]["items"][0]["jobTitle"]}"
puts "From #{payload["data"]["items"][0]["department"]["name"]}"
