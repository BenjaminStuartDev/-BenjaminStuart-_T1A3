# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './order_list_menu'

# top level commnet
class TableListMenu < Menu
  def initialize(tables, business)
    @business = business
    @tables = tables
    options = tables.map do |table|
      { name: "Table #{table.table_num}", value: table.table_num }
    end
    options << { name: 'Back', value: :break }
    super('All Tables', options)
  end

  def handle_selection(table_num)
    return :break if table_num == :break

    menu = OrderListMenu.new(@tables[table_num - @tables.length], @business)
    menu.run
  end
end
