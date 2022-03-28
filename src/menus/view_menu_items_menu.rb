# frozen_string_literal: true

require 'tty-prompt'
require_relative './menu'
require_relative './edit_menu_item_menu'

# top level documentation
class ViewMenuItemsMenu < Menu
  def initialize
    @options = create_options

    super('Settings: View Menu Items', @options)
  end

  def create_options
    options = @@business.menu_items.map do |menuitem|
      { name: menuitem.name, value: menuitem }
    end
    options << { name: 'Back', value: :break }
    return options
  end

  def handle_selection(selection)
    return :break if selection == :break

    menu = EditMenuItemMenu.new(selection)
    menu.run
    @options = create_options
  end
end
