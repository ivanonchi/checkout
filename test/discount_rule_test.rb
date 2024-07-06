require_relative 'test_helper'

class DiscountRuleTest < Minitest::Test
  def setup
    @product = Product.find('GR1')
    @rule = DiscountRule.new(@product)
  end

  def test_quantity_every
    @rule.quantity_every 2
    assert_equal 2, @rule.quantity
    assert_equal 'every', @rule.quantity_modifier
  end

  def test_quantity_at_least
    @rule.quantity_at_least 3
    assert_equal 3, @rule.quantity
    assert_equal 'at_least', @rule.quantity_modifier
  end

  def test_unit_price
    @rule.unit_price 15
    assert_equal 15, @rule.price
  end

  def test_unit_price_block
    @rule.unit_price { |p| p / 2 }
    # Note that it shouldn't round to two decimals here, but only the `Checkout#total` output.
    assert_equal @product.price / 2, @rule.price
  end
end