# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require './staff'
require './helpers'
require './validators'

# The StaffMemberMenu class represents the menu in which Managers can navigate the StaffMemberMenu
class StaffMemberMenu < Menu
  # initialises the class instance variable @staff_member and the options to be displayed to the user via TTY prompt
  def initialize(staff_member)
    @staff_member = staff_member
    options = [
      { name: 'Edit Name', value: 'Edit Name' },
      { name: 'Edit Password', value: 'Edit Password' },
      { name: 'Delete', value: 'Delete' },
      { name: 'Back', value: :break }
    ]
    super("Staff member #{@staff_member.name}", options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Delete - > Will delete the selected staff member (@staff_member)
  # Selection 2: Edit Name - > Will launch the new staff members name prompt
  # Selection 3: Edit Password - > will launch the new staf fmembers password prompt
  # Selection 4: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Delete'
      @@business.staff.delete(@staff_member)
      puts 'Staff member has been deleted'
      return :break
    when 'Edit Name'
      new_name = get_user_input('new staff members name', EmptyValidator)
      @staff_member.change_name(new_name)
      @menu_name = "Staff member #{new_name}"
      puts 'name has been succesfully changed'
    else
      new_password = get_user_input('new staff members password', EmptyValidator)
      @staff_member.change_password(new_password)
    end
  end
end
