require 'date'

module EnigmaHelpers

  def generate_key
    rand.to_s[2..6]
  end

  def generate_date
    current_date = Date.today.to_s

    formatted = []

    formatted << current_date[5..6]
    formatted << current_date[-2..-1]
    formatted << current_date[2..3]

    formatted.join
  end

  # Returns 4 key values from originally provided key
  def assign_keys(key)
    [key[0..1], key[1..2], key[2..3], key[3..4]]
  end

  # Gather last 4 integers of our squared date
  def assign_offsets(date)
    date_squared = date.to_i ** 2
    # Not DRY, but I'll refactor it later
    date_squared = date_squared.to_s

    [date_squared[-4], date_squared[-3], date_squared[-2], date_squared[-1]]
  end

  # Shift values are just key + offset
  def assign_shifts(key_arr, offset_arr)
    [key_arr[0].to_i + offset_arr[0].to_i,
    key_arr[1].to_i + offset_arr[1].to_i,
    key_arr[2].to_i + offset_arr[2].to_i,
    key_arr[3].to_i + offset_arr[3].to_i]
  end

  # Module - #return_hash(encrypted_message, @key, @offsets)

  # curr_ prefix means whatever was provided (current)
  def return_hash(curr_message, curr_key, curr_date, state)
    current_state = nil
    if state == 'enc'
      current_state = :encryption # Change 1st key value depending on state
    elsif state == 'dec'
      current_state = :decryption
    else
      puts "Invalid state."
    end

      # This way we don't have to write two separate return hashes for #encrypt
      # and #decrypt

      hash = {

        current_state => curr_message,
        key: curr_key,
        date: curr_date

      }
  end

  def encrypt_logic(message_arr, shifts_arr, char_set)
    encrypted_message = []
    shift_counter = 0

    message_arr.each do |char|

      # Find position of current character in @char_set
      relative_position = char_set.index(char)

      if !@char_set.include?(char)
        encrypted_message << char
        #shift_counter += 1
      else
        case shift_counter
        when 0
          # Rotate @char_set by value of shifts_array[0]
          shifted = char_set.rotate(shifts_arr[shift_counter])
          # Shovel into encrypted_message array
          encrypted_message << shifted[relative_position]
          #require 'pry'; binding.pry
          shift_counter += 1

        when 1
          # Same as above, but with shifts_array[1]
          shifted = char_set.rotate(shifts_arr[shift_counter])
          encrypted_message << shifted[relative_position]

          shift_counter += 1

        when 2
          shifted = char_set.rotate(shifts_arr[shift_counter])
          encrypted_message << shifted[relative_position]

          shift_counter += 1

        when 3
          shifted = char_set.rotate(shifts_arr[shift_counter])
          encrypted_message << shifted[relative_position]
          # Repeat this process until all characters have been gone through
          shift_counter = 0
        else
          puts "lol"
        end
      end
    end
    encrypted_message
  end

  def decrypt_logic(message_arr, shifts_arr, char_set)
    shift_counter = 0
    decrypted_message = []

    message_arr.each do |char|

      relative_position = char_set.index(char)
      if !@char_set.include?(char)
        decrypted_message << char
        #shift_counter += 1
      else
        case shift_counter
        when 0
          shifted = char_set.rotate(-shifts_arr[shift_counter])
          decrypted_message << shifted[relative_position]
          shift_counter += 1

        when 1
          shifted = char_set.rotate(-shifts_arr[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter += 1

        when 2
          shifted = char_set.rotate(-shifts_arr[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter += 1

        when 3
          shifted = char_set.rotate(-shifts_arr[shift_counter])
          decrypted_message << shifted[relative_position]

          shift_counter = 0

        else
          puts "lol"
        end
      end
    end
    decrypted_message
  end


end
