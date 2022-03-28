# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './list_menuitems_menu'

# The MenuItemSettingsMenu class represents the menu in which Managers can navigate the MenuItem settings
class MenuItemSettingsMenu < Menu
  # initialises the MenuItemSettings options
  def initialize
    options = [
      { name: 'View Menu Items', value: 'View menu items' },
      { name: 'Add Menu Item', value: 'Add menu Item' },
      { name: 'Back', value: :break }
    ]
    super('Menu Item Settings', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: View menu items - > Will launch the ListMenuItemsMenu
  # Selection 2: Add menu Items - > Will prompt the user to add MenuItems
  # Selection 3: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'View menu items'
      menu = ListMenuItemsMenu.new
      menu.run
    when 'Add menu Item'
      @@business.add_menu_item
      return :break
    end
  end
end
