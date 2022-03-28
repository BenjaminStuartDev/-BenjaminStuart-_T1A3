# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_staff_menu'

# top level documentation
class StaffSettings < Menu
  def initialize
    options = [
      { name: 'View Staff', value: 'View Staff' },
      { name: 'Add Staff', value: 'Add Staff' },
      { name: 'Back', value: :break }
    ]
    super('Staff Settings', options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'View Staff'
      menu = ViewStaffMenu.new
    else
      @@business.add_staff
      return :break
    end
    menu.run
  end
end
