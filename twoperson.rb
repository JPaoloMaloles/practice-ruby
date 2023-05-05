count = 0
while count < 11
  p count
  count += 1
end

sam_recipes = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
sam_recipes << "crepes"
sally_languages = ["1", "2", "3", "4", "5"]
sally_languages << "1"

if sam_recipes.length > 10 && sally_languages.length > 5
  puts "Sam and Sally should date"
else
  puts "They should see other people"
end

makes_crepes = false
sam_recipes.each do |recipe|
  if recipe == "crepes"
    makes_crepes = true
  end
end

speaks_french = false
sally_languages.each do |language|
  if language == "french"
    speaks_french = true
  end
end

if makes_crepes == true && speaks_french == true
  puts "They should marry"
else
  puts "It is a really bad idea to marry"
end
