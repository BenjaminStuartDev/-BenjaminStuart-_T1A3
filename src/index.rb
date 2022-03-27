# frozen_string_literal: true

require_relative './manager'
require_relative './menuitem'
require_relative './settingsinterface'
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

main_menu = MainMenu.new(business)
main_menu.run

print business.cafe_name
print business.staff
print business.tables
print business.menu_items

# First time setup

# prompt = TTY::Prompt.new
# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
