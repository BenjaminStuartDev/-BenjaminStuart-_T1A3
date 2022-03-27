class Table
  attr_reader :table_num, :orders

  def initialize(table_num, orders)
    @table_num = table_num
    @orders = orders
  end

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
