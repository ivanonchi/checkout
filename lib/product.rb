class Product
  attr_accessor :code, :name, :price, :currency

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value) if respond_to?("#{key}=")
    end
  end

  class << self
    def find(code)
      new(product_registry.find(code))
    end

    private

    def product_registry
      @product_registry ||= ProductRegistry.new
    end
  end
end
