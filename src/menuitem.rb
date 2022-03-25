# frozen_string_literal: true

require_relative './helpers'

# Top level documentation comment for 'class Staff'.
class Staff
  attr_reader :name, :password

  def initialize(name, price, ingredients)
    @name = name
    @price = price
    @ingredients = ingredients
  end
end
