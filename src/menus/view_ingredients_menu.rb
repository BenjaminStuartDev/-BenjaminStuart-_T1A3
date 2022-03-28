# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'

# The ViewIngredientsMenu class represents the menu in which users can view the list of ingredients a menu item has
class ViewIngredientsMenu < Menu
  # intialises the options to be displayed via TTY prompt
  def initialize(menu_item)
    options = menu_item.ingredients.map do |ingredient|
      { name: ingredient, value: ingredient, disabled: '' }
    end
    options << { name: 'Back', value: :break }
    super("#{menu_item.name} ingredients are:", options)
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # NOTE: All option selections are disabled by default except Back which returns the user to the previous menu.
  def handle_selection(selection)
    return :break if selection == :break
  end
end
