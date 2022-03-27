# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
# require_relative './settingsmenu'
require_relative './table_list_menu'

class MainMenu < Menu
  def initialize(business)
    super('Main Menu', [
      { name: 'View Tables', value: 'viewtables' },
      { name: 'Settings', value: 'Settings' },
      { name: 'Logout', value: :break }
    ])
    @business = business
  end

  def handle_selection(selection)
    return :break if selection == :break

    table_list_menu = TableListMenu.new(@business.tables)
    table_list_menu.run
  end
end
