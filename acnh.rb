require "http"
API_KEY = ""

def checknumber(idinput)
  return idinput.scan(/\D/).empty?
end

villager_id = "a"
while !checknumber(villager_id)
  puts "Please put in the village ID (1-413):"
  villager_id = gets.chomp
end

villager_example = HTTP.get("https://acnhapi.com/v1/villagers/#{villager_id}")
villager_data = villager_example.parse(:json)
pp villager_data
puts

regions = ["USen", "EUen", "EUde", "EUes", "USes", "EUfr", "USfr", "EUit", "EUnl", "CNzh", "TWzh", "JPja", "KRko", "EUru"]

villager_name = villager_data["name"]["name-USen"]
villager_personality = villager_data["personality"]
villager_birthdaystring = villager_data["birthday-string"]
villager_birthday = villager_data["birthday"]
puts "ID: #{villager_id}"
alreadydone = []
regions.each do |acronym|
  if !alreadydone.include?(acronym[2] + acronym[3])
    puts "Name (#{acronym[2] + acronym[3]}): #{villager_data["name"]["name-#{acronym}"]}"
    alreadydone << acronym[2] + acronym[3]
    #puts "alreadydone is:"
    #p alreadydone
  end
end
puts "Personality: #{villager_personality}"
puts "Birthday: #{villager_birthdaystring} (#{villager_birthday})"
