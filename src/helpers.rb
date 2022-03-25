# frozen_string_literal: true

require_relative './errors'

# returns the user input while handling input errors and input confirmation.
#
# @param data_name [String] A string containing the name of the data that is being requested.
# @param *validators [Proc] A validation proc containing raise errors and error messages to be displayed to the user.
#
# @return A string conaining the user input [String]
def get_user_input(data_name, *validators)
  print "Please enter your #{data_name}: "
  begin
    user_input = gets.chomp
    validators.each do |validator|
      validator.call(user_input, data_name)
    end

    confirmation = get_confirmation("Is '#{user_input}' correct? (Y/N): ")

    raise InvalidInputError, "Please re-enter your #{data_name}: " unless confirmation == 'Y'
  rescue InvalidInputError => e
    print e.message
    retry
  end
  return user_input
end

# Returns confirmation in the form of 'Y' or 'N' from user input.
#
# @param input [String] A string containing the confirmation message to be displayed to the user
#
# @return confirmation string 'Y' or 'N [String]
def get_confirmation(input)
  begin
    print input
    confirmation = gets.chomp.upcase
    raise(InvalidInputError) unless %w[Y N].include?(confirmation)
  rescue InvalidInputError => _e
    puts "Invalid input '#{confirmation}'. Please try again."
    retry
  end
  return confirmation
end
