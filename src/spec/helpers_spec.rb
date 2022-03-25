# frozen_string_literal: true

require './helpers'
require './validators'

describe '#get_user_input' do
  it 'Returns a string containing the user input' do
    allow(self).to receive(:gets).and_return('Blues Cafe', 'Y')
    expect(get_user_input('')).to eq('Blues Cafe')
  end
  it "Reprompts user if confirmation is 'N'" do
    allow(self).to receive(:gets).and_return('Blues Cafe', 'N', 'Reds Cafe', 'Y')
    expect(get_user_input('')).to eq('Reds Cafe')
  end
  it 'Allows for a proc to be passed in that handles an error and allows for user to retry' do
    allow(self).to receive(:gets).and_return('', 'Reds Cafe', 'Y')
    expect(get_user_input('', EmptyValidator)).to eq('Reds Cafe')
  end
end

describe '#get_confirmation' do
  it "returns a confirmation string 'Y' or 'N' based on user input" do
    allow(self).to receive(:gets).and_return('Y')
    expect(get_confirmation('')).to eq('Y')
  end
  it 'reprompts user if InvalidInputError is raised' do
    allow(self).to receive(:gets).and_return('J', ' ', '!', 'Y')
    expect(get_confirmation('')).to eq('Y')
  end
end
