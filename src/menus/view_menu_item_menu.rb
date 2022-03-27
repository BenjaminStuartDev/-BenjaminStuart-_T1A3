# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_ingredients_menu'

# takes orders as an array containing menuitem objects
class ViewMenuItemMenu < Menu
  def initialize(table, menu_item)
    @table = table
    @menu_item = menu_item
    options = [
      { name: "price: $#{menu_item.price}", value: 'price', disabled: '' },
      { name: "Add #{menu_item.name} to order?", value: 'Add menu item' },
      { name: "View #{menu_item.name} ingredients?", value: 'ingredients' },
      { name: 'Back', value: :break }
    ]
    super("Menu Item: #{menu_item.name}", options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'ingredients'
      menu = ViewIngredientsMenu.new(@menu_item)
      menu.run
    else
      @table.orders << @menu_item
      puts "#{@menu_item.name} has been added to table #{@table.table_num}'s order."
    end
  end
end
