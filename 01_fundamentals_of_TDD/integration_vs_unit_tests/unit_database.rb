require 'sqlite3'
require_relative 'quantity'

DimensionalMismatchError = Class.new(StandardError)

class UnitDatabase
  def initialize(database_filename)
    @db = find_or_create_db(database_filename)
  end

  def add_conversion(canonical_unit:, unit:, ratio:)
    db.execute(
      'INSERT INTO conversions VALUES (?, ?, ?)',
      [canonical_unit.to_s, unit.to_s, ratio]
    )
  end

  def conversion_ratio(from:, to:)
    rows = db.execute(
      'SELECT * FROM conversions WHERE unit IN (?, ?)',
      [from.to_s, to.to_s]
    )
    base_unit = common_unit(row)
    from_row = rows.find { |row| row[0] == base_unit && row[1] == from.to_s }
    to_row = rows.find { |row| row[0] == base_unit && row[1] == to.to_s }

    if from_row && to_row
      to_row[2] / from_row[2]
    else
      raise(DimensionalMismatchError, "Can't convert #{from} to #{to}!")
    end
  end

  def clear_conversions
    db.execute('DELETE FROM conversions')
  end

  private

  attr_reader :db

  # This part is not completed at all
  def find_or_create_db(filename)
    SQLite3::Database.new(filename)
  end
end
