require_relative 'test_helper'

class ProductRegistryTest < Minitest::Test
  def setup
    @pr = ProductRegistry.new
  end

  def item_gr1
    'GR1'
  end

  def test_find_item_gr1
    product = @pr.find(item_gr1)
    assert_equal 'Green tea', product.name
  end

  def test_find_non_existent_item
    assert_raises(ProductRegistry::RecordNotFound) { @pr.find('non_existent') }
  end
end
