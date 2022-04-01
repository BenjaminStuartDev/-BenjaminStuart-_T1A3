# frozen_string_literal: true

require './helpers'

# The MenuItem class represents the items on the cafe's menu
class MenuItem
  # sets the readable attributes for the object
  attr_reader :name, :price, :ingredients, :drink

  # initialises class variables @name, @price, @ingredients, drink
  #
  # @param name [String] name of the MenuItem
  # @param price [Float] price of the MenuItem
  # @param ingredients [Array] a list of ingredients [String]
  # @param drink [Boolean] true if the item is a drink item
  def initialize(name, price, ingredients, drink)
    @name = name
    @price = price
    @ingredients = ingredients
    @drink = drink
  end

  # defines the == operator so that objects can be compared
  def ==(other)
    return false if other.class != MenuItem

    return @name == other.name && @price == other.price && @ingredients == other.ingredients
  end

  # defines the two hash operated so that objects can be converted to hashes
  def to_h
    return { name: @name, price: @price, ingredients: @ingredients, drink: @drink }
  end

  # Adds ingredients to the class variable @ingredients
  #
  # @param ingredients [Array] an array of ingredients to be added to @ingredients
  def add_ingredients(ingredients)
    @ingredients += ingredients
  end

  # Removes an ingredient from the class variable @ingredients
  #
  # @param ingredient [String] a string containing the name of the ingredient to be removed
  def remove_ingredient(ingredient)
    @ingredients.delete(ingredient)
  end

  # sets the class variable @name to new_name
  #
  # @param new_name [String] a string containing the new name for the MenuItem
  def change_name(new_name)
    @name = new_name
  end

  # Sets the @price variable to new_price
  #
  # @param price [Float] a float that represents the price of the MenuItem
  def change_price(new_price)
    @price = new_price
  end
end
