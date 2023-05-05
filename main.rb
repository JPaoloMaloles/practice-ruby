require "./balloon.rb"
require "./brokenmodule.rb"
require "./food.rb"

food1 = Food.new(color: "red", price: 1.99, texture: "bumpy", shelf_life: "9 years")
puts food1.price
food1.price = 1.99
puts food1.price
puts

puts food1.broken
food1.broken = false
puts food1.broken
