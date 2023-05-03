# • Copy the Car and Bicycle class into your file: https://gist.github.com/peterxjang/e9b69b4de36b2c41ef4b
# • Use inheritance to DRY up the classes. Note - a car is NOT in a type of bicycle, and a bicycle is NOT a type of car!

# • To test it, create a bicycle and car instance from your newly modified classes (you can create them at the bottom of your file). First, have them accelerate. Then, make sure a bike can “Ring ring!” and a car "Beeeeeeep!"

class Transportation
  def initialize
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
  def ring_bell
    puts "Ring ring!"
  end
end

class Car < Transportation
  def honk_horn
    puts "Beeeeeeep!"
  end
end

car1 = Car.new
car1.honk_horn

bicycle1 = Bicycle.new
bicycle1.ring_bell
