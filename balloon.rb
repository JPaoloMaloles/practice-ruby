class Balloon
  attr_reader :color, :price, :texture
  attr_writer :color, :price, :texture

  def initialize(input)
    @color = input[:color]
    @price = input[:price]
    @texture = input[:texture]
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
