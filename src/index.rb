# frozen_string_literal: true

require_relative './menuitem'
require_relative './staff'
require_relative './business'
require 'tty-prompt'
require_relative './menus/main_menu'

# Initialises first user in users array.
# users = [Manager.new('Admin', 'Password')]

name = ARGV[0]
password = ARGV[1]

# Initialise Business
save_path = './saves/savefile.json'
business = Business.new

business.add_first_manager(name.chomp, password.chomp) unless name.nil?

if File.exist?(save_path) == false
  business.setup_pos
else
  business.load_save(save_path)
end

loop do
  system('clear')
  system('cls')
  login_attempt, user = login(business)
  next if login_attempt == false

  Menu.current_user = user
  Menu.business = business
  main_menu = MainMenu.new
  main_menu.run
end
