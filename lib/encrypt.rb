require './lib/enigma'

# Open provided file from CLI
file = File.open(ARGV[0], "r")

message = file.read.tr("\n", "") # Remove new line at end of string
enigma = Enigma.new

#require 'pry'; binding.pry
result = enigma.encrypt(message, ARGV[2], ARGV[3])

new_file = File.open(ARGV[1], "w")
new_file.write(result[:encryption])
new_file.close



puts "Created '#{ARGV[1]}' with the key '#{result[:key]}' and date '#{result[:date]}'"
