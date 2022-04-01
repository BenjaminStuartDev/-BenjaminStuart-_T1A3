# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_menu_item_menu'

# The PlaceOrderMenu class represents the menu in which users can place an order for a table
class PlaceOrderTypeMenu < Menu
  # initialiseses the @table and @menu_items class instance variables
  # @param table [Table] an object representing a hospitality Table
  def initialize(table, drink:)
    @table = table
    @drink = drink
    @menu_items = @@business.menu_items
    super('Menu item list', create_options)
  end

  def create_options
    options = []
    if @drink
      @menu_items.each_with_index do |menuitem, index|
        options << { name: menuitem.name, value: index } if menuitem.drink
      end
    else
      @menu_items.each_with_index do |menuitem, index|
        options << { name: menuitem.name, value: index } unless menuitem.drink
      end
    end
    options << { name: 'Back', value: :break }
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
