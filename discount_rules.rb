Discount.define do
  product 'GR1' do
    quantity_every 2
    unit_price 0
  end

  product 'SR1' do
    quantity_at_least 3
    unit_price 4.50
  end

  product 'CF1' do
    quantity_at_least 3
    unit_price do |price|
      price * 2.0 / 3.0
    end
  end
end
