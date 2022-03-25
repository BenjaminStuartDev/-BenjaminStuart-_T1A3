# frozen_string_literal: true

# Top level documentation comment for 'class Staff'.
class Staff
  attr_reader :name, :password

  @all_staff = []

  def initialize(name, password)
    @name = name
    @password = password
  end

  class << self
    def add_staff(name, password)
      return Staff.new(name, password)
    end

    # def load_users(file_path)
    # end

    # def remove_user(user)
    # end
  end
end
