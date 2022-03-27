class Table
  attr_reader :table_num, :orders

  def initialize(table_num, orders)
    @table_num = table_num
    @orders = orders
  end

  def to_h
    return { table_num: @table_num, orders: @orders }
  end
end
