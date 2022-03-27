# frozen_string_literal: true

require 'tty-prompt'

# Top level documentation comment for 'class Menu'.
class Menu
  def initialize(menu_name, options)
    @menu_name = menu_name
    @options = options
    @prompt = TTY::Prompt.new
  end

  def run
    loop do
      selection = @prompt.select(@menu_name, @options, cycle: true, filter: true)
      break if handle_selection(selection) == :break
    end
  end

  def handle_selection(_selection)
    raise NotImplementedError, 'handle_selection must be implmenented'
  end
end
