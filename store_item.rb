#C.1 - You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.

#C.2 - Represent 3 items using hashes. Each hash should have the same keys with different values.

#C.3 - Be sure to use symbols for the keys. Try creating hashes using both types of hash symbol syntaxes. (Ruby syntax {:a => 123} vs. “JavaScript” syntax {a: 123}).
balloonstore = [
  { color: "red", price: "1.99", texture: "bumpy" },
  { color: "blue", price: "2.99", texture: "sticky" },
  { :color => "green", :price => "3.99", :texture => "smooth" },
]

puts "The #{balloonstore[0][:texture]}, #{balloonstore[0][:color]} balloon costs #{balloonstore[0][:price]}"
puts "The #{balloonstore[1][:texture]}, #{balloonstore[1][:color]} balloon costs #{balloonstore[1][:price]}"
puts "The #{balloonstore[2][:texture]}, #{balloonstore[2][:color]} balloon costs #{balloonstore[2][:price]}"
