# frozen_string_literal: true

require_relative './helpers'

# Top level documentation comment for 'class Staff'.
class MenuItem
  attr_reader :name, :price, :ingredients

  def initialize(name, price, ingredients)
    @name = name
    @price = price
    @ingredients = ingredients
  end
end
