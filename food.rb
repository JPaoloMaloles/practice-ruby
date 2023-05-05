require "./brokenmodule.rb"
require "./balloon.rb"

class Food < Balloon
  attr_reader :shelf_life
  attr_writer :shelf_life
  include Broken

  def initialize(input)
    super
    @shelf_life = input[:shelf_life]
  end
end
