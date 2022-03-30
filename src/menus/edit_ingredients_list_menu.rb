# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './menu_item_settings_menu'
require './menuitem'
require_relative './edit_ingredient_menu'

# The EditIngredientListMenu class represents the menu in which a Manager can navigate and update a
# menu-items list of ingredients
class EditIngredientsListMenu < Menu
  # Initialises the options array to be passed into the TTY prompt via the parent class
  # as well as sets class instance variable for @menu_item
  def initialize(menu_item)
    @menuitem = menu_item
    @options = create_options
    @options.unshift({ name: 'Add ingredients', value: 'Add ingredients' })
    super('Which ingredient would you like to edit?', @options)
  end

  # The create_options method generates a list of ingredients to be passed into the TTY prompt as options
  def create_options
    options = @menuitem.ingredients.map do |ingredient|
      { name: ingredient, value: ingredient }
    end
    options << { name: 'Back', value: :break }
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 1: Add ingredients - > will prompt the user to add a new ingredients to the menu items ingredient array
  # Selection 'n': 'ingredient-name n' - > will launch the EditIngredientMenu
  # selection 'n + 1': Back - > will return the user to the previous Menu
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
      @@breaks = 1
    else
      menu = EditIngredientMenu.new(@menuitem, selection)
      menu.run
    end
    # create_options is called to ensure the TTY prompts displays using any updated changes
    @options = create_options
  end
end
