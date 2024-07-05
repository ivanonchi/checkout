require 'json'

# Sort of database containing all the products available
class ProductRegistry
  class RecordNotFound < StandardError; end

  def initialize
    @db = {}
    read_products
  end

  def find(code)
    data = @db[code.to_s]
    raise RecordNotFound if data.nil?

    data
  end

  private

  def read_products
    file = File.read('./products.json')
    data = JSON.parse(file)
    data.each do |product_data|
      @db[product_data['code']] = product_data
    end
  end
end
