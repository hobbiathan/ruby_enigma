module EnigmaHelpers

    def assign_keys(key)
      [key[0..1], key[1..2], key[2..3], key[3..4]]
    end


    def assign_offsets(date)
      date_squared = date.to_i ** 2
      # Not DRY, but I'll refactor it later
      date_squared = date_squared.to_s

      [date_squared[-4], date_squared[-3], date_squared[-2], date_squared[-1]]
    end

    def assign_shifts(key_arr, offset_arr)
      [key_arr[0].to_i + offset_arr[0].to_i,
      key_arr[1].to_i + offset_arr[1].to_i,
      key_arr[2].to_i + offset_arr[2].to_i,
      key_arr[3].to_i + offset_arr[3].to_i]
    end


    # Module - #return_hash(encrypted_message, @key, @offsets)
    def return_hash(encrypted_message)

      enc_hash = {
        encryption: encrypted_message,
        key: @key,
        date: @offsets

      }

    end
end
