# frozen_string_literal: true

require './errors'

describe InvalidInputError do
  let(:invalidinputerror) { InvalidInputError.new }

  it 'can be instantiated' do
    expect(invalidinputerror).not_to be_nil
    expect(invalidinputerror).to be_an_instance_of InvalidInputError
  end
end
