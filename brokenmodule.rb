module Broken
  attr_reader :broken
  attr_writer :broken

  def initialize(input)
    @broken = true
  end
end
