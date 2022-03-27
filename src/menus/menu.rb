# frozen_string_literal: true

require 'tty-prompt'
require_relative './menuitem'

# Top level documentation comment for 'class Menu'.
class Menu
  def initialize(menu_name, options)
    @menu_name = menu_name
    @options = options
    @prompt = TTY::Prompt.new
  end

  def run
    loop do
      selection = @prompt.select(@menu_name, @options)
      break if handle_selection(selection) == :break
    end
  end

  def handle_selection(_selection)
    raise NotImplementedError, 'handle_selection must be implmenented'
  end
end

# takes orders as an array containing menuitem objects
class OrderListMenu < Menu
  def initialize(table_num, orders)
    options = orders.each_with_index.map do |_, i|
      { name: "Order #{i}", value: i }
    end
    options << { name: 'Back', value: :break }
    options.unshift({ name: 'Place new order', value: :new_order })
    options.unshift({ name: "Bill total: #{sum_bill(orders)}", value: nil, disabled: true })
    super("Table #{table_num} Orders", options)
  end

  # returns bill_total and iterates of order which is an array of menu_items
  def sum_bill(orders)
    bill_total = 0
    orders.each do |order|
      bill_total += order.price
    end
  end

  def handle_selection(order_num)
    return :break if order_num == :break

    puts order_num
  end
end

class TableListMenu < Menu
  def initialize(tables)
    @tables = tables
    options = tables.each_with_index.map do |_, i|
      { name: "Table #{i}", value: i }
    end
    options << { name: 'Back', value: :break }
    super('All Tables', options)
  end

  def handle_selection(table_num)
    return :break if table_num == :break

    menu = OrderListMenu.new(table_num, @tables[table_num][:orders])
    menu.run
  end
end

tables = [
  {
    orders: [
      {},
      {},
      {}
    ]
  },
  {
    orders: [
      {},
      {},
      {},
      {},
      {}
    ]
  },
  {
    orders: [
      {},
      {}
    ]
  }
]

table_list_menu = TableListMenu.new(tables)
table_list_menu.run
