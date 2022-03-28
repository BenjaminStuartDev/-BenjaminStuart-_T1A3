# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_member_menu'

# The ViewStaffMenu class represents the menu in which Managers can navigate the list of staff members
class ViewStaffMenu < Menu
  # intialises the @staff and @options class instance variables
  def initialize
    @staff = @@business.staff
    @options = create_options
    super('View Staff Menu', @options)
  end

  # The create_options method generates a list of staff members to be passed into the TTY prompt as options
  def create_options
    options = @staff.map do |member|
      { name: "Employee: #{member.name}", value: member }
    end
    options << { name: 'Back', value: :break }
    return options
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection n: Staff member 'n' - > Will launch the StaffMemberMenu for the selected staff member
  # Selection n + 1: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    menu = StaffMemberMenu.new(selection)
    menu.run
    @options = create_options
  end
end
