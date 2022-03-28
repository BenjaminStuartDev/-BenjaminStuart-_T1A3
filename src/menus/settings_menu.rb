# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_settings'
require_relative './menu_item_settings_menu'
require_relative './business_settings_menu'

# top level documentation
class SettingsMenu < Menu
  def initialize(business)
    @business = business
    options = [
      { name: 'Staff Settings', value: 'Staff Settings' },
      { name: 'Menu Item Settings', value: 'Menu Item Settings' },
      { name: 'Business Settings', value: 'Business Settings' },
      { name: 'Back', value: :break }
    ]
    super('Settings Menu', options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Staff Settings'
      menu = StaffSettings.new(@business)
    when 'Menu Item Settings'
      menu = MenuItemSettingsMenu.new(@business)
    else
      menu = BusinessSettingsMenu.new(@business)
    end
    menu.run
  end
end
