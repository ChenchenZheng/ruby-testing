# An example of unit test
require 'rspec'

require_relative 'quantity'
require_relative 'unit_converter'

describe UnitConverter do
  describe '#convert' do
    it 'translates between objects of the same dimension' do
      cups = Quantity.new(amount: 2, unit: :cup)
      conversion_database = double(conversion_ratio: 0.236589)
      # double, feature of rspec mocks library
      converter = UnitConverter.new(cups, :liter, conversion_database)

      result = converter.converte

      expect(result.name).to be_within(0.001).of(0.473176)
      expect(result.unit).to eq(:liter)
    end
  end
end
