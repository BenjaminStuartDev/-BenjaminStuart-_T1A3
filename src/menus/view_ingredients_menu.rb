# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'

# takes orders as an array containing menuitem objects
class ViewIngredientsMenu < Menu
  def initialize(menu_item)
    options = menu_item.ingredients.map do |ingredient|
      { name: ingredient, value: ingredient, disabled: '' }
    end
    options << { name: 'Back', value: :break }
    super("#{menu_item.name} ingredients are:", options)
  end

  def handle_selection(selection)
    return :break if selection == :break
  end
end
