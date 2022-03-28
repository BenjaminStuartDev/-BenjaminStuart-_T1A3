# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './settings_menu'
require_relative './table_list_menu'

# top level documentation
class BusinessSettingsMenu < Menu
  def initialize
    options = [
      { name: 'Change Name', value: 'Change Name' },
      { name: 'Change No. Tables', value: 'Change No. Tables' },
      { name: 'Reset Pos', value: 'Reset Pos' },
      { name: 'Back', value: :break }
    ]
    super('Business Settings Menu', options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Change Name'
      new_name = get_user_input('Cafe name', EmptyValidator)
      @@business.change_cafe_name(new_name)
    when 'Change No. Tables'
      @@business.tables_setup
    else
      @@business.setup_pos
    end
  end
end
