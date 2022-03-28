# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_menu_items_menu'
# top level documentation
class MenuItemSettingsMenu < Menu
  def initialize
    options = [
      { name: 'View Menu Items', value: 'View menu items' },
      { name: 'Add Menu Item', value: 'Add menu Item' },
      { name: 'Back', value: :break }
    ]
    super('Menu Item Settings', options)
  end

  def handle_selection(selection)
    return :break if selection == :break
    case selection
    when 'View menu items'
      menu = ViewMenuItemsMenu.new
      menu.run
    when 'Add menu Item'
      @@business.add_menu_item
      return :break
    end
  end
end
