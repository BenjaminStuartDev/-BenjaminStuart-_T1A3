# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './place_order_menu'

# takes orders as an array containing menuitem objects
class OrderListMenu < Menu
  def initialize(table, business)
    @business = business
    options = table.orders.map do |menuitem|
      { name: menuitem.name, value: menuitem.name }
    end
    options << { name: 'Back', value: :break }
    options.unshift({ name: 'Place new order', value: :new_order })
    bill_total = sum_bill(table.orders)
    options.unshift({ name: "Bill total: $#{bill_total}", value: nil, disabled: '' })
    super("Table #{table.table_num} Orders", options)
  end

  # returns bill_total and iterates of order which is an array of menu_items
  def sum_bill(orders)
    bill_total = 0
    orders.each do |menuitem|
      bill_total += menuitem.price
    end
    return bill_total
  end

  def handle_selection(order_num)
    return :break if order_num == :break
    menu = PlaceOrderMenu.new(@business)
    menu.run
  end
end
