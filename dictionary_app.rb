require "http"
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions

# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
YOURAPIKEY = "03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy"

puts "Please input a word:"
word = gets.chomp
definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{YOURAPIKEY}")

definition_data = definition.parse(:json)
#List of Definitions

# definition_list = []
# definition_data.each do |adefinition|
#   adefinition.each do |specificdefinition|
#     specificdefinition << adefinition["text"]
#   end
# end
definitiontext = definition_data[1]["text"]
puts
puts "Definition: #{definitiontext}"
puts
puts "-----------------------------------------------------------------------------------------------------------------------------------"
examples = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=#{YOURAPIKEY}")

examples_data = examples.parse(:json)
topexample = examples_data["examples"][0]["text"]
puts "Here is an example of #{word} being used in a sentence:"

p topexample
puts
puts "-----------------------------------------------------------------------------------------------------------------------------------"
pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=#{YOURAPIKEY}")
pronunciation_data = pronunciation.parse(:json)
pronunciationtext = pronunciation_data[0]["raw"]

puts "The pronunciation is: #{pronunciationtext}"
