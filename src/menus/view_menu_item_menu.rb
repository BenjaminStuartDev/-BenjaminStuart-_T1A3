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
    super("Menu Item: #{menu_item.name}", create_options)
  end

  def create_options
    options = [
      { name: "price: $#{@menu_item.price}", value: 'price', disabled: '' },
      { name: "Add #{@menu_item.name} to order?", value: 'Add menu item' },
      { name: "View #{@menu_item.name} ingredients?", value: 'ingredients' }
    ]
    if @table.orders.include?(@menu_item)
      options << { name: "Remove existing #{@menu_item.name} from order", value: 'Remove Existing' }
    end
    options << { name: 'Back', value: :break }
    return options
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: price - > Not selectable by default and is used to display menuitems price
  # Selection 2: Add Menuitem to order? - > adds the menuitem to the selected tables list of orders
  # Selection 3: View Menuitems ingredients? - > launches the ViewIngredientsMenu
  # Selection 4: Back - > returns the user to the previous menu
  def handle_selection(selection)
    return :break if selection == :break

    case selection
    when 'ingredients'
      menu = ViewIngredientsMenu.new(@menu_item)
      menu.run
    when 'Add menu item'
      @table.orders << @menu_item
      puts "#{@menu_item.name} has been added to table #{@table.table_num}'s order."
      @@breaks = 2
    else
      @table.orders.delete(@menu_item)
      @@breaks = 2
    end
  end
end
