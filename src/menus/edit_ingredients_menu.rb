# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './staff_settings'
require_relative './menu_item_settings_menu'
require './menuitem'
require_relative './edit_ingredient_menu'

# top level documentation
class EditIngredientsMenu < Menu
  def initialize(menu_item)
    @menuitem = menu_item
    @options = create_options
    @options.unshift({ name: 'Add ingredients', value: 'Add ingredients' })
    super('Which ingredient would you like to edit?', @options)
  end

  def create_options
    options = @menuitem.ingredients.map do |ingredient|
      { name: ingredient, value: ingredient }
    end
    options << { name: 'Back', value: :break }
  end

  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'Add ingredients'
      ingredients = []
      loop do
        response = get_confirmation("Would you like to add an ingredient to #{@menuitem.name}'s ingredients (Y/N): ")
        break if response == 'N'

        ingredients << get_user_input('ingredient name', EmptyValidator)
      end
      @menuitem.add_ingredients(ingredients)
      return :break
    else
      menu = EditIngredientMenu.new(@menuitem, selection)
      menu.run
    end
    @options = create_options
  end
end
