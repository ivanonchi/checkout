# Discount rules definition file.
# Only allows one rule per product.
# If there are multiple rules defined for a product, only the last rules is applied.
# Rule definition:
# product '<product code>' do
#   quantity_every n: Every n of the same product, the product price will be `unit_price`.For 2x1 discounts.
#                     Mutually exclusive to the `quantity_at_least` rule.
#   quantity_at_least n: Purchases of n or more of the product will reduce the unit price to `unit_price`. 
#                        For bulk purchase discounts. Mutually exclusive to the `quantity_every` rule.
#   unit_price: Together with `quantity_every`, indicates the price for every nth product.
#               Paired with `quantity_at_least` indicates the unit price when purchased in bulk.
#               Accepts a numerical value or a block that has the product retail price as argument
#               to apply discounts based on current item price, like 10% off discounts.
# end

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
