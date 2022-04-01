# frozen_string_literal: true

require_relative './menuitem'
require_relative './staff'
require_relative './business'
require_relative './menus/main_menu'
require_relative './helpers'
require 'tty-prompt'

# Argument vectors used passed entered in the bash get assigned here to create the first manager in the POS system.
name = ARGV[0]
password = ARGV[1]

# Initialise Business
save_path = './saves/savefile.json'
business = Business.new
business.add_first_manager(name.chomp, password.chomp) unless name.nil?
if File.exist?(save_path) == false
  business.setup_poss
else
  business.load_save(save_path)
end

# Main Loop
loop do
  clear_terminal
  # Launches the login "menu"
  login_attempt, user = login(business)
  next if login_attempt == false

  Menu.current_user = user
  Menu.business = business
  # launches the MainMenu if login attempt is succesful
  main_menu = MainMenu.new
  main_menu.run

  # On logout prompts the user to advise if they would like to exit the application
  answer = get_confirmation('Would you like to exit the application completely? (Y/N) ')
  break if answer == 'Y'
  clear_terminal
end
clear_terminal
# Exit statement
puts Rainbow('Thank you for using the POS').white
