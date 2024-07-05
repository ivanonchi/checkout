class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def scan(code)
    @basket << code
  end

  def total
    @basket.inject(0) do |total, item|
      total + Product.find(item).price # TODO: Add rules to calculation
    end
  end
end
