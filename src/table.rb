# frozen_string_literal: true

# The Table class represents a tables in the cafe
class Table
  # sets the readable attributes for the object
  attr_reader :table_num, :orders

  #initialises the class instance variables @table_num and @orders
  #
  # @param table_num [Integer] number ID for the table
  # @param orders [Array] an array of menuitems placed under the given table ID
  def initialize(table_num, orders)
    @table_num = table_num
    @orders = orders
  end

  # defines the two hash operated so that objects can be converted to hashes
  def to_h
    orders = []
    unless @orders.empty?
      @orders.each do |menu_item|
        orders << { name: menu_item.name, price: menu_item.price, ingredients: menu_item.ingredients }
      end
    end
    return { table_num: @table_num, orders: orders }
  end
end
