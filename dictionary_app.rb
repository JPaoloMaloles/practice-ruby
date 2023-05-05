require "http"
# The program should ask the user to enter a word, then use the wordnik API to show the word’s definition: https://developer.wordnik.com/docs#!/word/getDefinitions

# Once that works, have it also display the top example and pronunciation (browse through the documentation to the top example and pronunciation).
YOURAPIKEY = "03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy"

puts "Please input a word:"
word = gets.chomp
definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=#{YOURAPIKEY}")

definition_data = definition.parse(:json)

definition_list = []
definition_data.each do |wordinstance| # 1
  if wordinstance["text"] != nil
    definition_list << wordinstance["text"]
  end
end

#definitiontext = definition_data[1]["text"]
puts
#puts "Definition: #{definitiontext}"
puts "Definitions:"
index = 0
definition_list.each do |definition|
  puts "#{index + 1}. #{definition}"
  index += 1
end
puts
puts "-----------------------------------------------------------------------------------------------------------------------------------"
examples = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=#{YOURAPIKEY}")

examples_data = examples.parse(:json)
multiexample = examples_data["examples"]

examples_list = []
multiexample.each do |wordinstance| # 1
  if wordinstance["text"] != nil
    examples_list << wordinstance["text"]
  end
end

#topexample = examples_data["examples"][0]["text"]

puts "Here is an example of '#{word}' being used in a sentence:"

#p topexample
index = 0
examples_list.each do |example|
  puts "#{index + 1}. #{example}"
  index += 1
end
puts
puts "-----------------------------------------------------------------------------------------------------------------------------------"
pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=#{YOURAPIKEY}")
pronunciation_data = pronunciation.parse(:json)
#pronunciationtext = pronunciation_data[0]["raw"]

pronunciations_list = []
pronunciation_data.each do |wordinstance| # 1
  if wordinstance["raw"] != nil
    pronunciations_list << wordinstance["raw"]
  end
end

#puts "The pronunciation is: #{pronunciationtext}"
puts "Here are pronunciations of '#{word}':"
index = 0
pronunciations_list.each do |pronunciation|
  puts "#{index + 1}. #{pronunciation}"
  index += 1
end
