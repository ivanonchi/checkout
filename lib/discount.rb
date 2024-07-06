class Discount
  attr_reader :rules

  def initialize
    @rules = {}
  end

  class << self
    def rules(file)
      contents = File.read(file)
      instance_eval(contents)
    end

    def define(&)
      discount = Discount.new
      discount.instance_eval(&)
      discount.rules
    end
  end

  def product(code, &block)
    @current_product = Product.find(code)
    @rule = DiscountRule.new(@current_product)
    @rules[code] = @rule
    @rule.instance_eval(&block)
  end
end
