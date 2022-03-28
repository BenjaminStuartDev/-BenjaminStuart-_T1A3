# frozen_string_literal: true

require_relative './menu'
require_relative './edit_menu_item_menu'
require 'tty-prompt'

# The ListMenuItemsMenu class represents the menu in which Managers can navigate and select the menu-item they
# would like to edit
class ListMenuItemsMenu < Menu
  # initialises the @options class instance variable
  def initialize
    @options = create_options
    super('Settings: View Menu Items', @options)
  end

  # The create_options method generates a list of menu-item options to be passed into the TTY prompt
  def create_options
    options = @@business.menu_items.map do |menuitem|
      { name: menuitem.name, value: menuitem }
    end
    options << { name: 'Back', value: :break }
    return options
  end

  # handle_selection has been over written to handle the users menu selection.
  #
  # Selection 'n': MenuItem 'n' - > Will launch the EditMenuItemMenu for the selected MenuItem
  # Selection 'n + 1': Back - > will return the user to the previous Menu
  def handle_selection(selection)
    return :break if selection == :break

    menu = EditMenuItemMenu.new(selection)
    menu.run
    @options = create_options
  end
end
