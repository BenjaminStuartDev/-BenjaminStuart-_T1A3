# frozen_string_literal: true

require_relative './staff'
require_relative './errors'
require_relative './helpers'

# Top level documentation comment for 'class Staff'.
class Business
  attr_reader :cafe_name

  def initialize
    @cafe_name = nil
    @staff = []
    # set_staff
  end

  # Prompts the user to input
  def setup_pos
    print "Hello and thank you for using Cafe POS V1! \nTo begin, please input the name of your cafe: "
    @cafe_name = Business.get_cafe_name
    confirmation = get_confirmation('Would you like to add new users to the POS? (Y/N) : ')
    puts 'confirmation' if confirmation == 'Y'
  end

  class << self
    # requests user input for to assaign variable cafe_name
    #
    # @return cafe_name [String]
    def get_cafe_name
      return get_user_input('Please re-enter your cafe name: ') do |menu_item|
        raise InvalidInputError, "Cafe name must not be empty.\nPlease re-enter your cafe name: " if menu_item.empty?
      end
    end

    def set_staff
      print 'What is the name of the staff member: '
      username = gets
      print 'What is the password for the new user: '
      password = gets
      puts "The username is #{username} and the password is #{password} would you like to retry? (Y/N) : "
      response = gets.chomp
      set_staff if response&.upcase == 'N'
    end
  end
end
# def add_user(name, password)
#   return Staff.new(name, password)
# end

# def new_user_prompt
#   print 'Please enter the '
# end
