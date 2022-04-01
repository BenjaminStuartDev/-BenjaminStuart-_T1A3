# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'

# The BusinessSettingsMenu class is accesseable by Managers and represents the business settings menu
class BusinessSettingsMenu < Menu
  # Initialises the options array to be passed into the TTY prompt via the parent class.
  def initialize
    options = [
      { name: 'Change Name', value: 'Change Name' },
      { name: 'Change No. Tables', value: 'Change No. Tables' },
      { name: 'Reset Pos', value: 'Reset Pos' },
      { name: 'Back', value: :break }
    ]
    super("#{@@business.cafe_name} Settings Menu", options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Change name  - > will prompt the user to change the business name
  # Selection 2: Change No. Tables - > will prompt the user to reset the number of tables the business has
  # Selection 3: Reset pos - > will delete all business data and restart the pos set up
  # Selection 4: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Change Name'
      new_name = get_user_input('Cafe name', EmptyValidator)
      @@business.change_cafe_name(new_name)
    when 'Change No. Tables'
      @@business.tables_setup
    else
      @@business.reset_pos
    end
  end
end
