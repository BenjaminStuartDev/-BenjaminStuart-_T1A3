# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './settings_menu'
require_relative './table_list_menu'

# The MainMenu class represents the first menu users see after the login
class MainMenu < Menu
  # Initialises the main menu options
  def initialize
    super('Main Menu', [
      { name: 'View Tables', value: 'viewtables' },
      { name: 'Settings', value: 'Settings' },
      { name: 'Logout', value: :break }
    ])
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: View Tables - > Will launch the TableListMenu
  # Selection 2: Settings - > Will launch the Settingsmenu
  # Selection 3: Logout - > will return the user to the logout Menu
  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'viewtables'
      table_list_menu = TableListMenu.new(@@business.tables)
    else
      table_list_menu = SettingsMenu.new
    end
    table_list_menu.run
  end
end
