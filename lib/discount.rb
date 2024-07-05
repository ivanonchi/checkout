class Discount

  def initialize
    @rules = {}
  end

  class << self
    def rules(file)
      contents = File.read(file)
      instance_eval(contents)
    end

    def define(&)
      discount_rules = Discount.new
      discount_rules.instance_eval(&)
    end
  end

  def product(code, &block)
    @current_product = Product.find(code)
    @rule = DiscountRule.new(@current_product)
    @rules[code] = @rule
    @rule.instance_eval(&block)
  end
end
