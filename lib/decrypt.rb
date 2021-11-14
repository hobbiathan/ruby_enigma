require './lib/enigma'

# Open provided file from CLI
if ARGV[2] == nil
  puts "No key provided, program terminated."
  return 0
end

file = File.open(ARGV[0], "r")

message = file.read.tr("\n", "") # Remove new line at end of string
enigma = Enigma.new

#require 'pry'; binding.pry
result = enigma.decrypt(message, ARGV[2], ARGV[3])
dec_message = result[:decryption]
key = result[:key]
date = result[:date]

new_file = File.open(ARGV[1], "w")
new_file.write(dec_message)
new_file.close



puts "Created '#{ARGV[1]}' with the key '#{key}' and date '#{date}'"
