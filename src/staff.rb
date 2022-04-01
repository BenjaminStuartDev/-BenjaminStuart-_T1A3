# frozen_string_literal: true

require_relative './helpers'

# The Staff class represents the individual employees that belong to the business
class Staff
  # sets the readable attributes for the object
  attr_reader :name, :password, :manager

  # initialises the class variables @name and @password for each Staff object
  #
  # @param name [String] name of the staff member
  # @param password [String] pasasword for the staff member
  # @param manager [Boolean] true or false depending on if the Staff member is a manager
  def initialize(name, password, manager)
    @name = name
    @password = password
    @manager = manager
  end

  # defines the == operator so that objects can be compared
  def ==(other)
    return false if other.class != Staff

    return @name == other.name && @password == other.password && @manager == other.manager
  end

  # defines the t0 hash operator so that objects can be converted to hashes
  def to_h
    return { name: @name, password: @password, manager: @manager }
  end

  # sets the class variable @name to new_name
  #
  # @param new_name [String] a string containing the new name for the Staff member
  def change_name(new_name)
    @name = new_name
  end

  # sets the class variable @manager to true
  def make_manager
    @manager = true
  end

  # sets the class variable @manager to false
  def remove_manager
    @manager = false
  end

  # sets the class variable @password to new_password
  #
  # @param new_password [String] a string containing the new password for the Staff member
  def change_password(new_password)
    @password = new_password
  end
end
