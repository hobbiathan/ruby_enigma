require_relative 'enigma_helpers'

class Enigma
  include EnigmaHelpers

  # TODO:
  # uhhh
  # #decrypt
  # #key_generator
  # #date_generator

  attr_reader :char_set

  def initialize
    @char_set = ("a".."z").to_a << " "
  end




  def encrypt(message, key, date)

    keys_array = assign_keys(key)
    offsets_array = assign_offsets(date)
    shifts_array = assign_shifts(keys_array, offsets_array)

    encrypted_message = []

    message_as_array = message.downcase.split('')

  # Definitely not DRY lol
  # Possibly make into its own method?
    shift_counter = 0

    message_as_array.each do |char|

      # Find position of current character in @char_set
      relative_position = @char_set.index(char)

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

    return_hash(encrypted_message.join, key, date, 'enc')
  end


  def decrypt(message, key, date)

    keys_array = assign_keys(key)
    offsets_array = assign_offsets(date)
    shifts_array = assign_shifts(keys_array, offsets_array)

    decrypted_message = []

    message_as_array = message.downcase.split('')

  # Definitely not DRY lol
  # Possibly make into its own method?
    shift_counter = 0

    message_as_array.each do |char|

      # Find position of current character in @char_set
      relative_position = @char_set.index(char)

      case shift_counter
      when 0
        # Rotate @char_set by value of shifts_array[0]
        shifted = @char_set.rotate(-shifts_array[shift_counter])
        # Shovel into encrypted_message array
        decrypted_message << shifted[relative_position]
        #require 'pry'; binding.pry
        shift_counter += 1

      when 1
        # Same as above, but with shifts_array[1]
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
        # Repeat this process until all characters have been gone through
        shift_counter = 0

      else
        puts "lol"
      end
    end

    return_hash(decrypted_message.join, key, date, 'dec')

  end




end
