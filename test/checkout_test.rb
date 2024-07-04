require_relative 'test_helper'

class CheckoutTest < Minitest::Test
  def setup
    @checkout = Checkout.new
  end

  def item_gr1
    'GR1'
  end

  def test_scan_item
    @checkout.scan(item_gr1)
    assert_equal 1, @checkout.basket.count
  end

  def test_buy_one_get_one_free_green_tea
    item = 'GR1'
    @checkout.scan(item)
    @checkout.scan(item)
    assert_equal 3.11, @checkout.total
  end
end
