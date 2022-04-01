# frozen_string_literal: true

require './validators'
require './errors'

describe 'EmptyValidator' do
  it 'raises InvalidInputError when the input is empty' do
    expect { EmptyValidator.call('', 'test_string') }.to raise_error(InvalidInputError)
  end
  it 'does not raise InvalidInputError when the input is not empty' do
    expect { EmptyValidator.call('input', 'test_string') }.not_to raise_error
  end
end

describe 'NumberValidator' do
  it 'raises InvalidInputError when the input is not a number' do
    expect { NumberValidator.call('', 'test_string') }.to raise_error(InvalidInputError)
  end
  it 'does not raise InvalidInputError when the input is a number' do
    expect { NumberValidator.call('5', 'test_string') }.not_to raise_error
  end
end

describe 'PercentageValidator' do
  it 'raises InvalidInputError when the input is not a percentage' do
    expect { PercentageValidator.call(110, 'test_string') }.to raise_error(InvalidInputError)
  end
  it 'does not raise InvalidInputError when the input is a percentage' do
    expect { PercentageValidator.call(50, 'test_string') }.not_to raise_error
  end
end
