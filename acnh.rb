require "http"
API_KEY = ""

def checknumber(idinput)
  return idinput.scan(/\D/).empty?
end

villagerid = "a"
while !checknumber(villagerid)
  puts "Please put in the village ID (1-413):"
  villagerid = gets.chomp
end

villager_example = HTTP.get("https://acnhapi.com/v1/villagers/#{villagerid}")
villager_data = villager_example.parse(:json)
p villager_data
