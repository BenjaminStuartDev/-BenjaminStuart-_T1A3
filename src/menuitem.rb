# frozen_string_literal: true

require './helpers'

# Top level documentation comment for 'class Staff'.
class MenuItem
  attr_reader :name, :price, :ingredients

  def initialize(name, price, ingredients)
    @name = name
    @price = price
    @ingredients = ingredients
  end

  def ==(other)
    return @name == other.name && @price == other.price && @ingredients == other.ingredients
  end

  def to_h
    return { name: @name, price: @price, ingredients: @ingredients }
  end

  def add_ingredients(ingredients)
    @ingredients += ingredients
  end

  def remove_ingredient(ingredient)
    @ingredients.delete(ingredient)
  end

  def change_name(new_name)
    @name = new_name
  end

  def change_price(new_price)
    @price = new_price
  end
end
