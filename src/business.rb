# frozen_string_literal: true

require_relative './staff'
require_relative './errors'
require_relative './helpers'
require_relative './validators'
require_relative './menuitems'

# The Business class represents the cafe.
class Business
  attr_reader :cafe_name, :staff

  def initialize
    @cafe_name = nil
    @staff = []
    @menu_items = [] # Name, Price, ingredients_arr
  end

  # Initialises the POS system by prompting the user to set up their business.
  # Adds cafe_name to Business, adds staff to Business and adds menu items to Business.
  def setup_pos
    print "Hello and thank you for using Cafe POS V1! \nWe are now going to setup your business.\n"
    @cafe_name = Business.get_cafe_name
    add_staff_prompt
    print @staff
    menu_setup
  end

  # Prompts the user to create a new staff member and updates global @staff array.
  def add_staff_prompt
    loop do
      response = get_confirmation('Would you like to add a new user to the POS? (Y/N): ')
      break if response == 'N'

      @staff << create_staff
    end
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
  def menu_setup
    loop do
      response = get_confirmation('Would you like to add a new menu item to the POS? (Y/N): ')
      break if response == 'N'

      @menu_items << create_menu_item
    end
  end

  # Creates a new menu_item object using user input for name, price and ingredients
  #
  # @return menu item object [MenuItem]
  def create_menu_item
    name = get_user_input('menu items name', EmptyValidator)
    price = Float(get_user_input('menu items price', EmptyValidator, NumberValidator))
    ingredients = []
    loop do
      response = get_confirmation('Would you like to add an ingredient to ingredients list (Y/N): ')
      break if response == 'N'

      ingredients << get_user_input('ingredient name', EmptyValidator)
    end
    return MenuItem.new(name, price, ingredients)
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
