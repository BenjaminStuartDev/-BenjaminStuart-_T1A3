# frozen_string_literal: true

require 'tty-prompt'

require_relative './menuitem'

# Top level documentation comment for 'class Staff'.
class Menu
  def initialize(menu_name, menu_options)
    @prompt = TTY::Prompt.new
    @menu_name = menu_name
    @lambdas = {}
    @menu_options = menu_options.map do |option|
      @lambdas[option[:value]] = option[:lambda]
      option.except(:lambda)
    end
  end

  def run
    loop do
      selection = @prompt.select(@menu_name, @menu_options)
      break if @lambdas[selection].call == 'break'
    end
  end
end

food_items_menu_options = [
  { name: 'Food Item 1',  value: 'Food Item 1', lambda: -> { puts 'Food Item 1' } },
  { name: 'Food Item 2',  value: 'Food Item 2', lambda: -> { puts 'Food Item 1' } },
  { name: 'Food Item 3',  value: 'Food Item 3', lambda: -> { puts 'Food Item 2' } },
  { name: 'Back',         value: 'Back',        lambda: -> { return 'break' } }
]

food_items_menu = Menu.new('Food Items Menu', food_items_menu_options)

menu_options = [
  { name: 'Food Items',   value: 'Food Items',  lambda: -> { food_items_menu.run } },
  { name: 'Drink Items',  value: 'Drink Items', lambda: -> { puts 'Drink Items Menu' } },
  { name: 'Back',         value: 'Back',        lambda: -> { return 'break' } }
]

def print_ingredients(menuitemobj)
  ingredient_list = menuitemobj.ingredients
  ingredient_list.each do |ingredient|
    puts ingredient
  end
end
menu_items_menu = Menu.new('Menu Items', menu_options)

menu_items_menu.run

ingredient_list = %w[Ingredient1 Ingredient2 ingredient3]

menuitem1 = MenuItem.new('Menu Item 1', 5.0, ingredient_list)

print_ingredients(menuitem1)
