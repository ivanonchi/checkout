# DSL implementation (read rules files)
class Discount
  attr_reader :rules

  def initialize
    @rules = {}
  end

  class << self
    # Read rules file and starts evaluating
    def rules(file)
      contents = File.read(file)
      instance_eval(contents)
    end

    # Entry point in the rules file.
    # Returns a hash with the discount rules { product => rules for product }
    def define(&)
      discount = Discount.new
      discount.instance_eval(&)
      discount.rules
    end
  end

  # Creates a new rule for each product block.
  # Delegates to DiscountRule to continue parsing rule contents.
  def product(code, &)
    @current_product = Product.find(code)
    @rule = DiscountRule.new(@current_product)
    @rules[code] = @rule
    @rule.instance_eval(&)
  end
end
