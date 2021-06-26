require 'spec_helper'

describe Person do
  it 'is invalid without a first name' do
    chenchen = Person.new(first_name: nil)

    expect(chenchen).to be_invalid
  end

  it 'is invalid with a blank first name' do
    chenchen = Person.new(first_name: '')

    expect(chenchen).to be_invalid
  end

  it 'is valid with a first name' do
    chenchen = Person.new(first_name: 'Chenchen')

    expect(chenchen).to be_valid
    # my version -> expect(chenchen.valid?).to eq(true)
  end
end
