module EnigmaHelpers

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
end
