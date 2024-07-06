# frozen_string_literal: true

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
    assert_equal 2, @checkout.basket.values.sum
  end

  def test_total_without_discounts_applicable
    @checkout.scan(GR1)
    @checkout.scan(SR1)
    @checkout.scan(CF1)
    assert_equal 19.34, @checkout.total
  end

  def test_buy_one_get_one_free_green_tea
    @checkout.scan(GR1)
    @checkout.scan(GR1)
    assert_equal 3.11, @checkout.total
  end

  def test_buy_3_strawberries_for_discount
    @checkout.scan(SR1)
    @checkout.scan(SR1)
    @checkout.scan(SR1)
    # Discounted price of 4.50 x 3
    assert_equal 13.50, @checkout.total
  end

  def test_buy_3_coffe_for_two_thirds_discount
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    # Discounted price of (11.23 * 2 / 3) x 3
    assert_equal 22.46, @checkout.total
  end

  def test_gr1_sr1_gr1_gr1_cf1
    @checkout.scan(GR1)
    @checkout.scan(SR1)
    @checkout.scan(GR1)
    @checkout.scan(GR1)
    @checkout.scan(CF1)
    assert_equal 22.45, @checkout.total
  end

  def test_sr1_sr1_gr1_sr1
    @checkout.scan(SR1)
    @checkout.scan(SR1)
    @checkout.scan(GR1)
    @checkout.scan(SR1)
    assert_equal 16.61, @checkout.total
  end

  def test_gr1_cf1_sr1_cf1_cf1
    @checkout.scan(GR1)
    @checkout.scan(CF1)
    @checkout.scan(SR1)
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    assert_equal 30.57, @checkout.total
  end

  def test_four_coffees_should_round_total_to_cents
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    @checkout.scan(CF1)
    assert_equal 29.95, @checkout.total
  end

  def test_checkout_without_discount_rules
    checkout = Checkout.new({})
    checkout.scan(GR1)
    checkout.scan(GR1)
    assert_equal 6.22, checkout.total
  end
end
