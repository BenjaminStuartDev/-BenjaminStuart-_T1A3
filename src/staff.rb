# frozen_string_literal: true

# Top level documentation comment for 'class Staff'.
class Staff
  attr_reader :name, :password

  @all_staff = []

  def initialize(name, password)
    @name = name
    @password = password

    Staff.all_staff << self
  end

  def first_time_setup(cafe_name)
    puts "Welcome #{cafe_name} owner. Would you like to add new right users now?"
  end

  class << self
    attr_reader :all_staff

    def add_user(name, password)
      return Staff.new(name, password)
    end

    def new_user_prompt
      print "Please enter the "


    # def load_users(file_path)
    # end

    # def remove_user(user)
    # end
  end
end

Staff.new('Nic', '123')
Staff.new('Ben', '123')
Staff.new('Sara', '123')

p Staff.all_staff
