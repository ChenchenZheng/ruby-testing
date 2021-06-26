require 'rspec/autorun'

class Person
  def initialize(first_name:, last_name:)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end
end

describe Person do
  describe '#full_name' do
    it 'returns the first and last names concatenated' do
      person = Person.new(
        first_name: 'Chenchen',
        last_name: 'Zheng'
      )

      expect(person.full_name).to eq('Chenchen Zheng')
    end
  end
end
