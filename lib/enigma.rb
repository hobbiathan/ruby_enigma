require_relative 'enigma_helpers'

class Enigma
  include EnigmaHelpers

  # TODO:
  # uhhh
  # Move #encrypt/#decrypt logic into module maybe
  # same thing with encrypt.rb/decrypt.rb
  # maybe start working on #crack
  # i'm falling asleep it's 12:14am 

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end

  # Generate key/date info if not provided (helper methods)
  def encrypt(message, key = generate_key, date = generate_date)

    # Creates an array of shift values, arguments are 2 new key/offset arrays
    # based off the current input
    shifts_array = assign_shifts(assign_keys(key), assign_offsets(date))

    # Accumulator
    encrypted_message = []

    # Turn message into array of characters to iterate through
    message_as_array = message.downcase.split('')

  # Definitely not DRY lol
  # Possibly make into its own method?
    shift_counter = 0

    message_as_array.each do |char|

      # Find position of current character in @char_set
      relative_position = @char_set.index(char)

      if !@char_set.include?(char)
        encrypted_message << char
        shift_counter += 1
      else
        case shift_counter
        when 0
          # Rotate @char_set by value of shifts_array[0]
          shifted = @char_set.rotate(shifts_array[shift_counter])
          # Shovel into encrypted_message array
          encrypted_message << shifted[relative_position]

          shift_counter += 1

        when 1
          # Same as above, but with shifts_array[1]
          shifted = @char_set.rotate(shifts_array[shift_counter])
          encrypted_message << shifted[relative_position]

          shift_counter += 1

        when 2
          shifted = @char_set.rotate(shifts_array[shift_counter])
          encrypted_message << shifted[relative_position]

          shift_counter += 1

        when 3
          shifted = @char_set.rotate(shifts_array[shift_counter])
          encrypted_message << shifted[relative_position]
          # Repeat this process until all characters have been gone through
          shift_counter = 0
        else
          puts "lol"
        end
      end
    end

    return_hash(encrypted_message.join, key, date, 'enc')
  end


  # Esentially the exact same thing as #encrypt, but rotate
  # backwards
  def decrypt(message, key, date = generate_date)

    shifts_array = assign_shifts(assign_keys(key), assign_offsets(date))
    decrypted_message = []
    message_as_array = message.downcase.split('')

    shift_counter = 0

    message_as_array.each do |char|

      relative_position = @char_set.index(char)
      if !@char_set.include?(char)
        decrypted_message << char
        shift_counter += 1
      else
        case shift_counter
        when 0
          shifted = @char_set.rotate(-shifts_array[shift_counter])
          decrypted_message << shifted[relative_position]
          shift_counter += 1

        when 1
          shifted = @char_set.rotate(-shifts_array[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter += 1

        when 2
          shifted = @char_set.rotate(-shifts_array[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter += 1

        when 3
          shifted = @char_set.rotate(-shifts_array[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter = 0

        else
          puts "lol"
        end
      end
    end

    return_hash(decrypted_message.join, key, date, 'dec')

  end




end
