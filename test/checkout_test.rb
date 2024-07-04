require_relative 'test_helper'

class CheckoutTest < Minitest::Test
  def setup
    pricing_rules = nil
    @checkout = Checkout.new(pricing_rules)
  end

  def test_buy_one_get_one_free_green_tea
    item = 'GR1'
    @checkout.scan(item)
    @checkout.scan(item)
    assert_equal 3.11, @checkout.total
  end
end
