# frozen_string_literal: true

require_relative './manager'
require_relative './menuitem'
require_relative './staff'
require_relative './business'
require 'tty-prompt'
require_relative './menus/main_menu'

# Initialises first user in users array.
# users = [Manager.new('Admin', 'Password')]

# Initialise Business
save_path = './saves/savefile.json'
business = Business.new
if File.exist?(save_path) == false
  business.setup_pos
else
  business.load_save(save_path)
end

loop do
  login_attempt, user = login(business)
  next if login_attempt == false

  Menu.current_user = user
  Menu.business = business
  main_menu = MainMenu.new
  main_menu.run
end
