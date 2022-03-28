# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require './validators'
require './helpers'
require_relative './edit_ingredients_menu'
require './business'

# top level documentation
class EditMenuItemMenu < Menu
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
      menu = EditIngredientsMenu.new(@menuitem)
      menu.run
    else
      @@business.menu_items.delete(@menuitem)
      puts 'Menu item has been deleted'
    end
    return :break
  end
end
