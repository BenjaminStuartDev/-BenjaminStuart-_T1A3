# frozen_string_literal: true

require_relative './staff'
require_relative './errors'
require_relative './helpers'
require_relative './validators'
require_relative './menuitem'
require_relative './table'
require 'rainbow'
require 'json'
require 'fileutils'
require 'tty-prompt'

# The Business class represents the cafe.
class Business
  # sets the readable attributes for the class
  attr_reader :cafe_name, :staff, :menu_items, :tables

  # sets the class variables @cafe_name [String], @staff [Array], @menu_items [Array], @tables [Array]
  def initialize
    @cafe_name = nil
    @staff = []
    @menu_items = []
    @tables = []
  end

  # Initialises the POS system by prompting the user to set up their business.
  # Adds cafe_name to Business, adds staff to Business, sets the tables for the business and adds menu items to Business.
  def setup_pos
    reset_pos
    print Rainbow("Hello and thank you for using Cafe POS V1! \nWe are now going to setup your business.\n").blue
    @cafe_name = Business.get_cafe_name
    prompt = TTY::Prompt.new
    loop do
      response = prompt.select('What would you like to do?', ['Add Staff', 'Add Menu Item', 'Set tables', 'Continue'])
      case response
      when 'Add Staff'
        add_staff
      when 'Add Menu Item'
        add_menu_item
      when 'Set tables'
        tables_setup
      when 'Continue'
        break
      end
    end
    create_save('./saves/savefile.json')
  end

  # resets all information stored in the business and deletes any save file
  def reset_pos
    File.delete('./saves/savefile.json') if File.exist?('./saves/savefile.json')
    name = get_user_input("What is the new owners name?")
    password = get_user_input("What is the new owners password")
    @cafe_name = nil
    @staff = [Staff.new(name, password, true)]
    @menu_items = []
    @tables = []
  end
  # Creates a new Staff object with role manager using parameters name and password
  #
  # @param name [String] a string containing the first managers name
  # @param password [String] a string containing the first managers password
  def add_first_manager(name, password)
    @staff << Staff.new(name, password, true)
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
    Staff.new(name, password, false)
  end

  # Returns the user input for menu item
  #
  # @return menu item name [String]
  def add_menu_item
    @menu_items << create_menu_item
  end

  # Creates a new menu_item object using user input for name, price, type (drink or food) and ingredients
  #
  # @return menu item object [MenuItem]
  def create_menu_item
    name = get_user_input('menu item name', EmptyValidator)
    price = Float(get_user_input('menu item price', EmptyValidator, NumberValidator))
    type = get_confirmation('Is the menu item a drink? (Y/N): ')
    type = (type != 'N')
    ingredients = []
    loop do
      response = get_confirmation('Would you like to add an ingredient to the menu items ingredients (Y/N): ')
      break if response == 'N'

      ingredients << get_user_input('ingredient name', EmptyValidator)
    end
    MenuItem.new(name, price, ingredients, type)
  end

  # Sets up empty tables for the business
  def tables_setup
    @tables = []
    tables = Integer(get_user_input('number of tables', EmptyValidator, NumberValidator))
    until tables.zero?
      @tables << Table.new(tables, [])
      tables += -1
    end
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
      information = { cafe_name: @cafe_name, staff: @staff.map(&:to_h), menu_items: @menu_items.map(&:to_h),
                      tables: @tables.map(&:to_h) }
      File.write(path, JSON.pretty_generate(information))
    end
  end

  # loads the cafe name, staff array, tables array and menu items array from the 'path' into memory
  #
  # @param path [String] a string containing the filepath to load the save from
  def load_save(path)
    return unless File.exist?(path)

    parsed = JSON.load_file(path, symbolize_names: true)
    @cafe_name = parsed[:cafe_name]
    staff_arr = parsed[:staff]
    staff_arr.each do |staff|
      @staff << Staff.new(staff[:name], staff[:password], staff[:manager])
    end
    menuitems_arr = parsed[:menu_items]
    menuitems_arr.each do |menu_item|
      @menu_items << MenuItem.new(menu_item[:name], menu_item[:price], menu_item[:ingredients], menu_item[:drink])
    end
    tables_arr = parsed[:tables]
    tables_arr.each do |table|
      orders = []
      table[:orders].each do |menu_item|
        orders << MenuItem.new(menu_item[:name], menu_item[:price], menu_item[:ingredients], menu_item[:drink])
      end

      @tables << Table.new(table[:table_num], orders)
    end
  end

  # sets the cafe name to new_name
  #
  # @param new_name [String] a string containing the new name of the cafe
  def change_cafe_name(new_name)
    @cafe_name = new_name
  end

  class << self
    # requests user input to assaign variable cafe_name
    #
    # @return cafe_name [String]
    def get_cafe_name
      get_user_input('Cafe name', EmptyValidator)
    end
  end
end
