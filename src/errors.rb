# frozen_string_literal: true

# Top level documentation comment for 'class Staff'.
class InvalidNameError < StandardError
  def message
    'Name must not be empty'
  end
end
