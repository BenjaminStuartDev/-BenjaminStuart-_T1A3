# frozen_string_literal: true

require_relative './errors'

# InalidInputError Proc for validating against empty input
EmptyValidator = proc { |user_input, data_name|
  raise InvalidInputError, "#{data_name} cannot be empty\nPlease re-enter #{data_name}: " if user_input.empty?
}

# InalidInputError Proc for validating against non numeric input
NumberValidator = proc { |user_input, data_name|
  begin
    Float(user_input)
  rescue StandardError
    raise InvalidInputError, "#{data_name} must be a number\nPlease re-enter #{data_name}: "
  end
}
