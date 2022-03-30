# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_staff_menu'

# The StaffSettings class represents the menu in which Managers can navigate the StaffSettingsMenu
class StaffSettingsMenu < Menu
  # initialises the options to be displayed to the user via TTP prompt
  def initialize
    options = [
      { name: 'View Staff', value: 'View Staff' },
      { name: 'Add Staff', value: 'Add Staff' },
      { name: 'Back', value: :break }
    ]
    super('Staff Settings', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: View Staff- > Will launch the ViewStaffMenu
  # Selection 2: Add Staff - > Will prompt the user to add a new staff member.
  # Selection 3: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'View Staff'
      menu = ViewStaffMenu.new
      menu.run
    else
      @@business.add_staff
      @@breaks = 1
    end
  end
end
