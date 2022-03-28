# frozen_string_literal: true

require_relative './helpers'

# Top level documentation comment for 'class Staff'.
class Staff
  attr_reader :name, :password

  def initialize(name, password)
    @name = name
    @password = password
  end

  def ==(other)
    return @name == other.name && @password == other.password
  end

  def to_h
    return { name: @name, password: @password }
  end

  def change_name(new_name)
    @name = new_name
  end

  def change_password(new_password)
    @password = new_password
  end

  # class << self
  #   # def load_users(file_path)
  #   # end

  #   # def remove_user(user)
  #   # end
  # end
end
