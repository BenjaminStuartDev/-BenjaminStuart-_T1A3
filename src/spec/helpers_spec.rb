# frozen_string_literal: true

require './helpers'

describe '#get_user_input' do
  it 'Returns a string containing the user input' do
    allow(self).to receive(:gets).and_return('Blues Cafe', 'Y')
    expect(get_user_input('')).to eq('Blues Cafe')
  end
  it "Reprompts user if confirmation is 'N'" do
    allow(self).to receive(:gets).and_return('Blues Cafe', 'N', 'Reds Cafe', 'Y')
    expect(get_user_input('')).to eq('Reds Cafe')
  end
  it 'Allows for a block to be passed in that raises an error' do
    allow(self).to receive(:gets).and_return('', 'Blues Cafe', 'Y')
    expect(
      get_user_input('') do |something|
        if something.empty?
          raise InvalidInputError, "something item name must not be empty.\nPlease re-enter your something item: "
        end
      end
    ).to eq('Blues Cafe')
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
