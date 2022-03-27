# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'

# top level documentation
class StaffSettings < Menu
  def initialize(business)
    @business = business
    options = [
      { name: 'View Staff', value: 'View Staff' },
      { name: 'Add Staff', value: 'Add Staff' },
      { name: 'Back', value: :break }
    ]
    super('Staff Settings', options)
  end

  def handle_selection(selection)
    return :break if selection == :break
    
    # menu = []
    # menu.run
  end
end
