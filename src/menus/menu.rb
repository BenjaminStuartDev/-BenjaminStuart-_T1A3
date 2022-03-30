# frozen_string_literal: true

require 'tty-prompt'

# The Menu class represents the generic Menu prompt that is inherited by all Menu subclasses
class Menu
  # Sets the Menu class variable that is used to access the business object by all Menu subclasses
  @@business = nil
  # Initialises the tty prompt
  #
  # @param menu_name [String] A string containing the name of the menu to be displayed
  # @param options [Array] An array of hashes containing all option keys and their selection values to be displayed by ttp prompt
  def initialize(menu_name, options)
    @menu_name = menu_name
    @options = options
    @prompt = TTY::Prompt.new
  end

  # the run method is used to begin the menu loop
  def run
    loop do
      selection = @prompt.select(@menu_name, @options, cycle: true, filter: true)
      break if handle_selection(selection) == :break

      @@business.save('./saves/savefile.json') # saves changed information after every loop
      system("clear")
      system("cls")
    end
  end

  # handle_selection is used to determine what to do based on the users menu selection.
  # the handle_selection raises a NotImplementedError if the handle_selection has not been overwritten by inheriting classes.
  def handle_selection(_selection)
    raise NotImplementedError, 'handle_selection must be implmenented'
  end

  # self.business= is used to set the class attribute @@business outside of the class.
  def self.business=(business)
    @@business = business
  end
end
