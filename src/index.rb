# frozen_string_literal: true

require_relative './interface'
require_relative './manager'
require_relative './menuitem'
require_relative './settingsinterface'
require_relative './staff'
require_relative './business'
require 'tty-prompt'

# Initialises first user in users array.
# users = [Manager.new('Admin', 'Password')]

# Initialise Business
business = Business.new
business.setup_pos
print business.load_save('./saves/savefile.json')

# First time setup

# prompt = TTY::Prompt.new
# prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))