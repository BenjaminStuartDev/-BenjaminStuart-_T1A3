# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './view_menu_item_menu'

# takes orders as an array containing menuitem objects
class PlaceOrderMenu < Menu
  def initialize(table)
    @table = table
    @menu_items = @@business.menu_items

    options = @menu_items.each_with_index.map do |menuitem, index|
      { name: menuitem.name, value: index }
    end
    options << { name: 'Back', value: :break }
    super('Menu item list', options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    menu = ViewMenuItemMenu.new(@table, @menu_items[selection])
    menu.run
  end
end
