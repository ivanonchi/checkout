class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def scan(code)
    @basket << code
  end

  def total

  end
end
