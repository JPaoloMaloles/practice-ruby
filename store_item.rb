#C.1 - You are the owner of a store that sells items (you decide what specifically). Each item has various properties such as color, price, etc.

#C.2 - Represent 3 items using hashes. Each hash should have the same keys with different values.

#C.3 - Be sure to use symbols for the keys. Try creating hashes using both types of hash symbol syntaxes. (Ruby syntax {:a => 123} vs. “JavaScript” syntax {a: 123}).
balloonstore = [
  { color: "red", price: "1.99", texture: "bumpy" },
  { color: "blue", price: "2.99", texture: "sticky" },
  { :color => "green", :price => "3.99", :texture => "smooth" },
]

puts "------------------------------"
puts "this is the Hash version"
puts
puts "The #{balloonstore[0][:texture]}, #{balloonstore[0][:color]} balloon costs #{balloonstore[0][:price]}"
puts "The #{balloonstore[1][:texture]}, #{balloonstore[1][:color]} balloon costs #{balloonstore[1][:price]}"
puts "The #{balloonstore[2][:texture]}, #{balloonstore[2][:color]} balloon costs #{balloonstore[2][:price]}"

# Exercise: Rewrite your store items using a class instead of a hash.
# a) Choose which attributes should have “reader” methods and which attributes should have “writer” methods.
# b) Create an instance from your store item class. Use puts statements to print the 3 attributes individually to the terminal.

class Balloon
  def initialize(color, price, texture)
    @color = color
    @price = price
    @texture = texture
  end

  def color
    @color
  end

  def color=(color)
    @color = color
  end

  def price
    @price
  end

  def price=(price)
    @price = price
  end

  def texture
    @texture
  end

  def texture=(texture)
    @texture = texture
  end
end

balloon1 = Balloon.new("red", 1.99, "bumpy")
balloon2 = Balloon.new("blue", 2.99, "sticky")
balloon3 = Balloon.new("green", 3.99, "smooth")

puts
puts "------------------------------"
puts "this is the Class version"
puts
puts "The #{balloon1.texture}, #{balloon1.color} balloon costs #{balloon1.price}"
puts "The #{balloon2.texture}, #{balloon2.color} balloon costs #{balloon2.price}"
puts "The #{balloon3.texture}, #{balloon3.color} balloon costs #{balloon3.price}"

# Exercise: Replace your “reader” and “writer” methods using the attr_reader and attr_writer shortcuts!
# Bonus: Read more about how attr_reader works its magic (advanced stuff here)

class Balloon
  attr_reader :color, :price, :texture
  attr_writer :color, :price, :texture

  def initialize(color, price, texture)
    @color = color
    @price = price
    @texture = texture
  end
end

balloon1 = Balloon.new("red", 1.99, "bumpy")
balloon2 = Balloon.new("blue", 2.99, "sticky")
balloon3 = Balloon.new("green", 3.99, "smooth")

puts
puts "------------------------------"
puts "this is the Class version using attr_reader & attr_writer"
puts
puts "The #{balloon1.texture}, #{balloon1.color} balloon costs #{balloon1.price}"
puts "The #{balloon2.texture}, #{balloon2.color} balloon costs #{balloon2.price}"
puts "The #{balloon3.texture}, #{balloon3.color} balloon costs #{balloon3.price}"

# Exercise: Rewrite your store items using a class with a single options hash in the initialize method.

class Balloon
  attr_reader :color, :price, :texture
  attr_writer :color, :price, :texture

  def initialize(input)
    @color = input[:color]
    @price = input[:price]
    @texture = input[:texture]
  end
end

balloon1 = Balloon.new(color: "red", price: 1.99, texture: "bumpy")
balloon2 = Balloon.new(color: "blue", price: 2.99, texture: "sticky")
balloon3 = Balloon.new(color: "green", price: 3.99, texture: "smooth")

puts
puts "------------------------------"
puts "this is the Class version where the initialize method accepts a single hash"
puts
puts "The #{balloon1.texture}, #{balloon1.color} balloon costs #{balloon1.price}"
puts "The #{balloon2.texture}, #{balloon2.color} balloon costs #{balloon2.price}"
puts "The #{balloon3.texture}, #{balloon3.color} balloon costs #{balloon3.price}"
