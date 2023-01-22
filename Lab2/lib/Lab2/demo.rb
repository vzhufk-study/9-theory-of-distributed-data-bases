require_relative 'engine'
require_relative 'parser'

Engine.new.threads

# Engine.new.archive

puts Parser.new(/Pro/).go_to_page('https://stylus.ua/iphone-170/', 3)