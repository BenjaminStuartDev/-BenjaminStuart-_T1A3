# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require './helpers'

# The EditIngredientMenu class represents the menu in which a Manager can an ingredient item.
class EditIngredientMenu < Menu
  # initialises the options array and sets class instance variables @menu_item and @ingredient
  #
  # @param menu_item [MenuItem] menu item object
  # @param ingredient [String] name of the ingredient
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

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Edit Ingredient Name - > Will prompt the user to change the name of the ingredient
  # Selection 2: Remove Ingredient - > Will remove the selected ingredient from the menu items list of ingredients
  # Selection 3: Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    if selection == 'Remove Ingredient'
      @menu_item.remove_ingredient(@ingredient)
    else
      new_name = get_user_input('ingredient name', EmptyValidator)
      @menu_item.ingredients.select { |s| s == @ingredient }.each { |s| s.replace(new_name) }
    end
    @@breaks = 1
  end
end
