require './lib/enigma'

# Open provided file from CLI
file = File.open(ARGV[0], "r")

message = file.read.tr("\n", "") # Remove new line at end of string
enigma = Enigma.new

#require 'pry'; binding.pry
result = enigma.encrypt(message)
enc_message = result[:encryption]
key = result[:key]
date = result[:date]

new_file = File.open(ARGV[1], "w")
new_file.write("Encrypted Message: #{enc_message}\n")
new_file.write("Encryption Key: #{key}\n")
new_file.write("Encryption Date: #{date}\n")
new_file.close



puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
