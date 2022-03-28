# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_menu_item_menu'

# The PlaceOrderMenu class represents the menu in which users can place an order for a table
class PlaceOrderMenu < Menu
  # initialiseses the @table and @menu_items class instance variables
  # @param table [Table] an object representing a hospitality Table
  def initialize(table)
    @table = table
    @menu_items = @@business.menu_items

    options = @menu_items.each_with_index.map do |menuitem, index|
      { name: menuitem.name, value: index }
    end
    options << { name: 'Back', value: :break }
    super('Menu item list', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection n: menu_item n - > Will launch the ViewMenuItemMenu for the selected menu_item
  # Selection n + 1: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    menu = ViewMenuItemMenu.new(@table, @menu_items[selection])
    menu.run
  end
end
