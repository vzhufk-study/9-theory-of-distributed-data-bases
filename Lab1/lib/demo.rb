require_relative 'parser'

parser = Parser. new(/Pro/)

cart = parser.parse('https://stylus.ua/iphone-170/')

cart.new.save_to_json('data.json')
cart.new.save_to_file('data')
cart.new.save_to_csv('data.csv')