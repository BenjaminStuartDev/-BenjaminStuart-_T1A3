# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_ingredients_menu'

# The ViewMenuItemMenu class represents the menu in which users can view the list of MenuItems
class ViewMenuItemMenu < Menu
  # Initialises the @table and @menu_item class instance variable as well as sets the options
  # to be displayed to the user via TTP prompt.
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

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: price - > Not selectable by default and is used to display menuitems price
  # Selection 2: Add Menuitem to order? - > adds the menuitem to the selected tables list of orders
  # Selection 3: View Menuitems ingredients? - > launches the ViewIngredientsMenu
  # Selection 4: Back - > returns the user to the previous menu
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
