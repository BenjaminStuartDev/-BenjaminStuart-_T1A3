# frozen_string_literal: true

require_relative './staff'
require_relative './errors'
require_relative './helpers'
require_relative './validators'
require_relative './menuitem'
require 'json'
require 'fileutils'
require 'tty-prompt'

# The Business class represents the cafe.
class Business
  attr_reader :cafe_name, :staff, :menu_items

  def initialize
    @cafe_name = nil
    @staff = []
    @menu_items = []
  end

  # Initialises the POS system by prompting the user to set up their business.
  # Adds cafe_name to Business, adds staff to Business and adds menu items to Business.
  def setup_pos
    print "Hello and thank you for using Cafe POS V1! \nWe are now going to setup your business.\n"
    @cafe_name = Business.get_cafe_name
    prompt = TTY::Prompt.new
    loop do
      response = prompt.select('What would you like to do?', ['Add Staff', 'Add Menu Item', 'Continue'])
      case response
      when 'Add Staff'
        add_staff
      when 'Add Menu Item'
        add_menu_item
      when 'Continue'
        break
      end
    end
    create_save('./saves/savefile.json')
  end

  # Prompts the user to create a new staff member and updates global @staff array.
  def add_staff
    @staff << create_staff
  end

  # Creates a new Staff object using user input for name and password
  #
  # @return staff member object [Staff]
  def create_staff
    name = get_user_input('staff members name', EmptyValidator)
    password = get_user_input('staff members password', EmptyValidator)
    return Staff.new(name, password)
  end

  # Returns the user input for menu item
  #
  # @return menu item name [String]
  def add_menu_item
    @menu_items << create_menu_item
  end

  # Creates a new menu_item object using user input for name, price and ingredients
  #
  # @return menu item object [MenuItem]
  def create_menu_item
    name = get_user_input('menu item name', EmptyValidator)
    price = Float(get_user_input('menu item price', EmptyValidator, NumberValidator))
    ingredients = []
    loop do
      response = get_confirmation('Would you like to add an ingredient to the menu items ingredients (Y/N): ')
      break if response == 'N'

      ingredients << get_user_input('ingredient name', EmptyValidator)
    end
    return MenuItem.new(name, price, ingredients)
  end

  # creates new .json savefile inside of the chosen directory
  #
  # @param path [String] a string containing the filepath for the savefile
  def create_save(path)
    dir = File.dirname(path)
    FileUtils.mkdir_p(dir) unless File.directory?(dir)
    File.new(path, 'w')
    save(path)
  end

  # saves cafe name, staff array and menu items array inside of a json file at the specified path.
  #
  # @param path [String] a string containing the filepath for the savefile
  def save(path)
    if File.exist?(path) == false
      create_save(path)
    else
      information = { cafe_name: @cafe_name, staff: @staff.map(&:to_h), menu_item: @menu_items.map(&:to_h) }
      File.write(path, JSON.pretty_generate(information))
    end
  end

  def load_save(path)
    return unless File.exist?(path)

    parsed = JSON.load_file(path, symbolize_names: true)
  end

  class << self
    # requests user input to assaign variable cafe_name
    #
    # @return cafe_name [String]
    def get_cafe_name
      return get_user_input('Cafe name', EmptyValidator)
    end
  end
end
