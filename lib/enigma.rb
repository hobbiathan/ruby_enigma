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

  # Not passing an argument in CLI returns as nil
  # which is technically still a return value, ergo why
  # assigning a default value within the parameter doesn't
  # work properly, and therein we need our first two if checks

  # Strange, since it seemed to have been working earlier
  def encrypt(message, key = generate_key, date = generate_date)
    if key == nil
      key = generate_key
    end

    if date == nil
      date = generate_date
    end

    # Creates an array of shift values, arguments are 2 new key/offset arrays
    # based off the current input
    shifts_array = assign_shifts(assign_keys(key), assign_offsets(date))

      # Turn message into array of characters to iterate through
    message_array = message.downcase.split('')

    encrypted_message = encrypt_logic(message_array, shifts_array, @char_set)
    # returns encrypted_message

    return_hash(encrypted_message.join, key, date, 'enc')
  end


  # Esentially the exact same thing as #encrypt, but rotate
  # backwards
  def decrypt(message, key, date = generate_date)
    if date == nil
      date = generate_date
    end

    shifts_array = assign_shifts(assign_keys(key), assign_offsets(date))
    message_array = message.downcase.split('')

    decrypted_message = decrypt_logic(message_array, shifts_array, @char_set)
    return_hash(decrypted_message.join, key, date, 'dec')
  end



end
