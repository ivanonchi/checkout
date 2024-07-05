require_relative 'test_helper'

class CheckoutTest < Minitest::Test
  def setup
    pricing_rules = Discount.rules('discount_rules.rb')
    @checkout = Checkout.new(pricing_rules)
  end

  GR1 = 'GR1'
  SR1 = 'SR1'
  CF1 = 'CF1'

  def test_scan_item_adds_to_basket
    @checkout.scan(GR1)
    @checkout.scan(GR1)
    assert_equal 2, @checkout.basket.count
  end

  def test_total_without_discounts
    @checkout.scan(GR1)
    @checkout.scan(SR1)
    @checkout.scan(CF1)
    assert_equal 19.34, @checkout.total
  end

  def test_buy_one_get_one_free_green_tea
    item = 'GR1'
    @checkout.scan(item)
    @checkout.scan(item)
    assert_equal 3.11, @checkout.total
  end
end
