# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_member_menu'

# top level documentation
class ViewStaffMenu < Menu
  def initialize(business)
    @business = business
    @staff = business.staff
    @options = create_options
    super('View Staff Menu', @options)
  end

  def create_options
    options = @staff.map do |member|
      { name: "Employee: #{member.name}", value: member }
    end
    options << { name: 'Back', value: :break }
    return options
  end

  def handle_selection(selection)
    return :break if selection == :break

    menu = StaffMemberMenu.new(@business, selection)
    menu.run
    @options = create_options
  end
end
