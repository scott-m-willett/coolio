require './lib/benedict_lib.rb'

words = eval File.read('./lib/cewl.rb')
words = Benedict.generate words
Benedict.save words
