class Checkout
  attr_accessor :basket

  def initialize(rules)
    @basket = []
    @rules = rules
  end

  def scan(code)
    @basket << code
  end

  def total
    product_count = @basket.each_with_object(Hash.new(0)) { |code, hash| hash[code] += 1 }

    product_count.inject(0) do |total, product_quantity|
      code = product_quantity[0]
      quantity = product_quantity[1]
      rule = @rules[code]
      price = rule.apply(quantity)
      total + price
    end
  end
end
