# frozen_string_literal: true

require_relative './menu'
require_relative './view_menu_item_menu'
require_relative './place_order_type_menu'
require 'tty-prompt'

# The PlaceOrderMenu class represents the menu in which users can select what type of order they wish to place
class PlaceOrderMenu < Menu
  # initialiseses the @table and @menu_items class instance variables
  # @param table [Table] an object representing a cafe Table
  def initialize(table)
    @table = table
    @menu_items = @@business.menu_items

    options = [
      { name: 'Place Food Order', value: 'food order' },
      { name: 'Place Drink Order', value: 'drink order' },
      { name: 'Back', value: :break }
    ]
    super('Menu item list', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Place Food Order - > Will launch the PlaceOrderTypeMenu with the drink: false parameter
  # Selection 2: Place Drink Order - > Will launch the PlaceOrderTypeMenu with the drink: true parameter
  # Selection 3: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'food order'
      menu = PlaceOrderTypeMenu.new(@table, drink: false)
    else
      menu = PlaceOrderTypeMenu.new(@table, drink: true)
    end
    menu.run
  end
end
