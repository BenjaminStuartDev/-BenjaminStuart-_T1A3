require 'tty-table'
table = TTY::Table.new(%w[header1 header2], [%w[a1 a2], %w[b1 b2]])
# puts table.render(:ascii)
