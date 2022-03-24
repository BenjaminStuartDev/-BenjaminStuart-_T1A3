# frozen_string_literal: true

require_relative './interface'
require_relative './manager'
require_relative './menuitem'
require_relative './settingsinterface'
require_relative './staff'

# Initialises first user in users array.
users = [Manager.new('Admin', 'Password')]

# Initialises interface
interface = Interface.new

# First time setup
interface.set_cafe_name
puts "Thank you #{interface.cafe_name} owner.\n We now need to setup the first user."

