require "http"

# response = HTTP.get "https://data.cityofchicago.org/resource/xzkq-xp2w.json"
# p response
# p response.parse(:json) #parses out the json
# pp response.parse(:json) #pp means pretty print

system "clear" #What the system command does is type out the input into the terminal

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=chicago&units=imperial&APPID=YOURAPIKEY")

weather_data = response.parse(:json)

pp weather_data

temperature = weather_data["main"]["temp"]
description = weather_data["weather"][0]["description"]

p description

puts "Today in Chicago it is #{temperature} degrees outside with #{description}."
