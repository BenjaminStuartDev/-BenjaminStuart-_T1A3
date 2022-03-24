# frozen_string_literal: true

require_relative './errors'

# Top level documentation comment for 'class Staff'.
class Interface
  attr_reader :cafe_name

  def initialize
    @cafe_name = nil
  end

  # Prompts for user input to set attribute cafe_name [string]
  def set_cafe_name
    confirmation = nil
    print "Hello and thank you for using Cafe POS V1! \nTo begin, please input the name of your cafe: "
    until confirmation&.upcase == 'Y'
      print 'Please input the name of your cafe again: ' if confirmation&.upcase == 'N'
      @cafe_name = gets.chomp
      if @cafe_name.empty?
        puts 'Cafe name must not be empty'
        next
      end
      print "Is #{@cafe_name} is correct? (Y/N): "
      confirmation = gets.chomp
    end
  end

  # Displays welcome message and prompts user for Username [string] and Password [string]
  #
  # @returns [username, password]
  def greet
    puts "Welcome to #{@cafe_name} POS!\n Please input your name and password below."
    print 'Name: '
    username = gets.chomp
    print 'Password: '
    password = gets.chomp
    return [username, password]
  end
end
