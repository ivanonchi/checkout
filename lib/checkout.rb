class Checkout
  attr_accessor :basket

  def initialize(rules)
    @basket = Hash.new(0)
    @rules = rules
  end

  def scan(code)
    @basket[code] += 1
  end

  def total
    @basket.inject(0) do |total, product_quantity|
      code = product_quantity[0]
      quantity = product_quantity[1]
      rule = @rules[code]
      price = rule&.apply(quantity) || price_for(code, quantity)
      total + price
    end.round(2)
  end

  private

  def price_for(code, quantity)
    Product.find(code).price * quantity
  end
end
