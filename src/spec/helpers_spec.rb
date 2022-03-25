# frozen_string_literal: true

require './helpers'

describe '#get_user_input' do
  it "Reprompts user if confirmation is 'N'" do
    allow(get_user_input).to receive(:gets).and_return('Blues Cafe', 'N', 'Reds Cafe', 'Y')
    expect(get_user_input('Please re-enter your cafe name: '))
  end
end
