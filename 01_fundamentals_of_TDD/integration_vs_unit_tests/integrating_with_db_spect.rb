require 'rspec'

require_relative 'quantity'
require_relative 'unit_converter'
require_relative 'unit_database'

describe 'converting units using data from a UnitDatabase' do
  def database_filename
    'test_db.sqlite'
  end

  # around block ensure every test in the describe block will delete the file db
  around do |example|
    begin
      example.run
    ensure
      File.delete(database_filename)
    end
  end

  def create_and_populate_database(filename = database_filename)
    db = UnitDatabase.new(filename)
    db.clear_conversions
    db.add_conversion(canonical_unit: :liter, unit: :cup, ratio: 4.22675)
    db.add_conversion(canonical_unit: :liter, unit: :liter, ratio: 1)
    db.add_conversion(canonical_unit: :liter, unit: :pint, ratio: 2.11338)
    db.add_conversion(canonical_unit: :gram, unit: :gram, ratio: 1)
    db.add_conversion(canonical_unit: :gram, unit: :kilogram, ratio: 1000)
    db
  end

  it 'converts between cups and pints through liters' do
    db = create_and_populate_database
    cups = Quantity.new(amout: 2, unit: :cup)
    converter = UnitConverter.new(cups, :pint, db)

    result = converter.convert

    expect(result.amout).to be_within(0.001).of(1)
    expect(result.unit).to eq(:pint)
  end
end
