# frozen_string_literal: true

require 'tty-table'
require './helpers'
require './validators'

# The Table class represents a tables in the cafe
class Table
  # sets the readable attributes for the object
  attr_reader :table_num
  attr_accessor :orders, :discount

  # initialises the class instance variables @table_num and @orders
  #
  # @param table_num [Integer] number ID for the table
  # @param orders [Array] an array of menuitems placed under the given table ID
  def initialize(table_num, orders)
    @table_num = table_num
    @orders = orders
  end

  def tabulate(total_bill)
    table_contents = []
    @orders.each do |menuitem|
      table_contents << [menuitem.name, "$#{menuitem.price}"]
    end
    discount = Float(get_user_input('Table Discount', EmptyValidator, NumberValidator, PercentageValidator))
    discount_total = total_bill * discount / 100
    if discount.positive?
      table_contents << ['Discount %: ', "#{discount}%"]
      table_contents << ['Discount Total: ', "$#{discount_total}"]
    end
    bill_total = total_bill - discount_total
    table_contents << ['Total Bill: ', "$#{bill_total}"]
    puts "Table #{@table_num}"
    table = TTY::Table.new(%w[Order Price], table_contents)
    return table.render(:ascii)
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
