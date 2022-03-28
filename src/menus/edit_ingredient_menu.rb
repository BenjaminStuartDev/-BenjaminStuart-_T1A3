# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_settings'
require_relative './menu_item_settings_menu'
require './menuitem'
require './helpers'

# top level documentation
class EditIngredientMenu < Menu
  def initialize(menu_item, ingredient)
    @menu_item = menu_item
    @ingredient = ingredient
    options = [
      { name: 'Edit Ingredient Name', value: 'Edit Ingredient Name' },
      { name: 'Remove Ingredient', value: 'Remove Ingredient' },
      { name: 'Back', value: :break }
    ]
    super("Editing #{@menu_item.name}, #{@ingredient}", options)
  end

  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'Remove Ingredient'
      @menu_item.remove_ingredient(@ingredient)
      return :break
    else
      new_name = get_user_input('ingredient name', EmptyValidator)
      @menu_item.ingredients.select { |s| s == @ingredient }.each { |s| s.replace(new_name) }
    end
    return :break
  end
end
