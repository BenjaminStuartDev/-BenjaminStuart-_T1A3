# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_settings_menu'
require_relative './menu_item_settings_menu'
require_relative './business_settings_menu'

# The SettingsMenu class represents the menu in which Managers can navigate the settings menus
class SettingsMenu < Menu
  # initialises the options array to be displayed by the TTY prompt
  def initialize
    options = [
      { name: 'Staff Settings', value: 'Staff Settings' },
      { name: 'Menu Item Settings', value: 'Menu Item Settings' },
      { name: 'Business Settings', value: 'Business Settings' },
      { name: 'Back', value: :break }
    ]
    super('Settings Menu', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Staff Settings - > Will launch the StaffSettings menu
  # Selection 2: MenuItemSettingsMenu - > Will launch the MenuItemSettingsMenu
  # Selection 3: BusinessSettingsMenu - > will launch the BusinessSettingsMenu
  # Selection 4: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Staff Settings'
      menu = StaffSettingsMenu.new
    when 'Menu Item Settings'
      menu = MenuItemSettingsMenu.new
    else
      menu = BusinessSettingsMenu.new
    end
    menu.run
  end
end
