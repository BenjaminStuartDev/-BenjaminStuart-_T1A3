# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_settings'

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

    menu = StaffSettings.new(@business)
    menu.run
  end
end
