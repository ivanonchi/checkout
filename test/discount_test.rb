# frozen_string_literal: true

require 'minitest/autorun'

describe Discount do
  before do
    @rules = Discount.rules('test/fixtures/discount_rules.rb')
  end

  describe 'when reading a set of 3 rules' do
    it 'creates a rule for each product' do
      _(@rules.count).must_equal 3
      %w[GR1 SR1 CF1].each do |code|
        _(@rules.keys).must_include code
      end
    end
  end
end
