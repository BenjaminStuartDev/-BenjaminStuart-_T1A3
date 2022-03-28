# frozen_string_literal: true

# The InvalidInputError class represents standard errors that are not in the StandardErrors class
class InvalidInputError < StandardError
  # initialises the msg to be displayed when an InvalidInputError is raised
  def initialize(msg = 'Invalid Input')
    super(msg)
  end
end
