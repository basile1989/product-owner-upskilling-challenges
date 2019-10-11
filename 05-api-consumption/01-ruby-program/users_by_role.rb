require "json"
require "rest-client"

puts "What is the role of the users you're looking for? (e.g. Figgo - Manager)"
role_name = gets.chomp # asks user to type something in the Terminal

puts "Ok got it! Let's search for the users..."


token = "18afcfb8-697b-4742-b726-418269485cee"
headers = { "Authorization" => "Lucca application=#{token}" }
url = "https://wagon.ilucca-demo.net/api/v3/roles?name=#{role_name}"
response = RestClient.get(url, headers)
payload = JSON.parse(response.body)

role_id = payload["data"]["items"][0]["id"]

url = "https://wagon.ilucca-demo.net/api/v3/users?fields=name,jobTitle&rolePrincipalid=#{role_id}"
response = RestClient.get(url, headers)
payload = JSON.parse(response.body)

total_count = payload["data"]["items"].count


puts "Total: #{total_count} people found"
puts ""

payload["data"]["items"].each do |list|

puts "#{list["name"]}"
puts "#{list["jobTitle"]}"
puts "---"

end
