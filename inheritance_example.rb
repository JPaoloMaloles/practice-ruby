# • Copy the Car and Bicycle class into your file: https://gist.github.com/peterxjang/e9b69b4de36b2c41ef4b
# • Use inheritance to DRY up the classes. Note - a car is NOT in a type of bicycle, and a bicycle is NOT a type of car!

# • To test it, create a bicycle and car instance from your newly modified classes (you can create them at the bottom of your file). First, have them accelerate. Then, make sure a bike can “Ring ring!” and a car "Beeeeeeep!"

class Transportation
  attr_reader :speed, :direction
  attr_writer :speed, :direction

  def initialize(input)
    @speed = 0
    @direction = "north"
  end

  def brake
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def turn(new_direction)
    @direction = new_direction
  end
end

class Bicycle < Transportation
  attr_reader :type, :weight
  attr_writer :type, :weight

  def initialize(input)
    super
    @type = input[:type]
    @weight = input[:weight]
  end

  def ring_bell
    puts "Ring ring!"
  end
end

class Car < Transportation
  attr_reader :fuel, :make, :model
  attr_writer :fuel, :make, :model

  def initialize(input)
    super
    @fuel = input[:fuel]
    @make = input[:make]
    @model = input[:model]
  end

  def honk_horn
    puts "Beeeeeeep!"
  end
end

# car1 = Car.new
# car1.honk_horn

# bicycle1 = Bicycle.new
# bicycle1.ring_bell

# Open the inheritance_example.rb file from the previous example.

# Add car specific attributes (instance variables) to the Car class (fuel, make, model, etc.) and bicycle specific attributes to the Bicycle class (type, weight, etc.). Use the super method to keep the initialize methods DRY.

car2 = Car.new(fuel: "gasoline", make: "1997", model: "Ferrari")
bicycle2 = Bicycle.new(type: "mountain", weight: "999 lb")

puts car2.fuel
puts bicycle2.type
