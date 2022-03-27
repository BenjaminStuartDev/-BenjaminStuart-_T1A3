# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './place_order_menu'
require './menuitem'

# takes orders as an array containing menuitem objects
class OrderListMenu < Menu
  def initialize(table, business)
    @business = business
    @table = table
    options = create_options
    super("Table #{table.table_num} Orders", options)
  end

  def create_options
    options = @table.orders.map do |menuitem|
      { name: menuitem.name, value: menuitem }
    end
    options << { name: 'Back', value: :break }
    options.unshift({ name: 'Place new order', value: :new_order })
    bill_total = sum_bill(@table.orders)
    options.unshift({ name: "Bill total: $#{bill_total}", value: nil, disabled: '' })
  end

  # returns bill_total and iterates of order which is an array of menu_items
  def sum_bill(orders)
    bill_total = 0
    orders.each do |menuitem|
      bill_total += menuitem.price
    end
    return bill_total
  end

  def handle_selection(selection)
    return :break if selection == :break

    if selection.is_a?(MenuItem)
      menu = ViewMenuItemMenu.new(@table, selection)
    else
      menu = PlaceOrderMenu.new(@table, @business)
    end
    menu.run
    @options = create_options # This is to ensure it recalculates bill total after items have been added to the table orders
  end
end
