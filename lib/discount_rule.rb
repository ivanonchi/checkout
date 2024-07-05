class DiscountRule
  attr_reader :quantity, :quantity_modifier, :price

  TOKENS = %i[quantity_every quantity_at_least unit_price].freeze

  def initialize(product)
    @product = product
  end

  def method_missing(name, *args)
    super unless TOKENS.include? name
    rule_name = name.to_s
    if rule_name.start_with?('quantity_')
      @quantity = args[0]
      @quantity_modifier = rule_name.delete_prefix('quantity_')
    elsif rule_name == 'unit_price'
      @unit_price = block_given? ? yield(@product.price) : args[0]
    end
  end

  def respond_to_missing?(name, include_private = false)
    TOKENS.include?(name) or super
  end
end
