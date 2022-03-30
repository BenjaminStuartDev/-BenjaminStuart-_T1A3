require 'tty-prompt'
require './helpers'

@prompt = TTY::Prompt.new

name1 = @prompt.ask('Please enter your Name: ')
name2 = @prompt.mask('Please enter your password: ')

p name1, name2
