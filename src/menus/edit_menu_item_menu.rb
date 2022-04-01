# frozen_string_literal: true

require_relative './edit_ingredients_list_menu'
require_relative './menu'
require 'tty-prompt'
require './validators'
require './helpers'
require './business'

# The EditMenuItemMenu class represents the menu in which Managers can remove/edit a selected MenuItem
class EditMenuItemMenu < Menu
  # initialises the options array and sets class instance variables @menu_item
  #
  # @param menu_item [MenuItem] menu item object
  def initialize(menuitem)
    @menuitem = menuitem
    options = [
      { name: "Edit Name (#{@menuitem.name})", value: 'Edit Name' },
      { name: "Edit Price ($#{@menuitem.price})", value: 'Edit Price' },
      { name: 'Edit Ingredients', value: 'Edit Ingredients' },
      { name: 'Delete', value: 'Delete' },
      { name: 'Back', value: :break }
    ]
    super("#{@menuitem.name} Settings", options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Edit Mame  - > will prompt the user to change the menu-items name
  # Selection 2: Edit Price - > will prompt the user to change the menu-items price
  # Selection 3: Edit Ingredients - > will launch the EditIngredientsListMenu
  # Selection 4: Delete - > will delete the menu-item from the business menu items array
  # Selection 5: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'Edit Name'
      new_name = get_user_input('new menu item name', EmptyValidator)
      @menuitem.change_name(new_name)
    when 'Edit Price'
      new_price = Float(get_user_input('new menu item price', EmptyValidator, NumberValidator))
      @menuitem.change_price(new_price)
    when 'Edit Ingredients'
      menu = EditIngredientsListMenu.new(@menuitem)
      menu.run
    else
      @@business.menu_items.delete(@menuitem)
      puts 'Menu item has been deleted'
    end
  end
end
