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
end
