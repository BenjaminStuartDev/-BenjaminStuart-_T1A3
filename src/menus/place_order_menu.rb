# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './order_list_menu'

# takes orders as an array containing menuitem objects
class PlaceOrderMenu < Menu
  def initialize(business)
    @business = business
    @menu_items = business.menu_items

    options = @menu_items.map do |menuitem|
      { name: menuitem.name, value: menuitem.name }
    end
    options << { name: 'Back', value: :break }
    super('Menu item list', options)
  end

  def handle_selection(selection)
    return :break if selection == :break
    
    puts order_num
  end
end
