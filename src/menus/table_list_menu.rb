# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './order_list_menu'

# The TableListMenu class represents the menu in which users can navigate the list of tables 
# when looking to place an order
class TableListMenu < Menu
  # initialises the @tables class variable and sets the options to be displayed via TTP Prompt
  def initialize(tables)
    @tables = tables
    options = tables.map do |table|
      { name: "Table #{table.table_num}", value: table.table_num }
    end
    options << { name: 'Back', value: :break }
    super('All Tables', options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection n: Table n - > Will launch the OrderListMenu for the given table n
  # Selection n + 1: Back - > will return the user to the previous Menu
  def handle_selection(table_num)
    return :break if table_num == :break

    menu = OrderListMenu.new(@tables[table_num - @tables.length])
    menu.run
  end
end
