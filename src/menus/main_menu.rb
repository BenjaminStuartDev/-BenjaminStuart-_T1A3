# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './settings_menu'
require_relative './table_list_menu'

# top level documentation
class MainMenu < Menu
  def initialize
    super('Main Menu', [
      { name: 'View Tables', value: 'viewtables' },
      { name: 'Settings', value: 'Settings' },
      { name: 'Logout', value: :break }
    ])
  end

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
