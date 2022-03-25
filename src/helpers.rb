# frozen_string_literal: true

require_relative './errors'

# returns the user input while handling input errors and input confirmation.
#
# @param disconfirm_msg [String] A string contining the dis-confirm message to be displayed to the user.
# @param &_block [block] A block containing raise errors and error messages to be displayed to the user.
#
# @return A string conaining the user input [String]
def get_user_input(disconfirm_msg, &_block)
  begin
    user_input = gets.chomp
    yield user_input if block_given?

    confirmation = get_confirmation("Is '#{user_input}' correct? (Y/N): ")

    raise InvalidInputError, disconfirm_msg unless confirmation == 'Y'
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

# Returns the user input for menu item
#
# @return menu item name [String]
def get_menu_item
  print 'Please enter your menu item name: '
  return get_user_input('Please re-enter your menu-item name: ') do |menu_item|
    if menu_item.empty?
      raise InvalidInputError, "Menu item name must not be empty.\nPlease re-enter your menu item name: "
    end
  end
end
