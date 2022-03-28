# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require './staff'
require './helpers'
require './validators'

# top level documentation
class StaffMemberMenu < Menu
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
