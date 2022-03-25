# frozen_string_literal: true

# Top level documentation comment for 'class Staff'.
class InvalidInputError < StandardError
  def initialize(msg = 'Invalid Input')
    super(msg)
  end
end
