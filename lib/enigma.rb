class Enigma


  # TODO:
  # REFACTOR #ENCRYPT

  # (Possibly) move all keys/offset attributes into a module
  # Move #key_setup?/#offset_setup? into helper modules
  # Create #encrypt helper methods for autogenerating keys/date values


  attr_reader :message, :key, :offsets, :char_set

  # @offsets is the current date
  def initialize
    @message = nil
    @key = nil
    @offsets = nil
    @char_set = ("a".."z").to_a << " "

    # lol
    key_a = nil
    key_b = nil
    key_c = nil
    key_d = nil

    offset_a = nil
    offset_b = nil
    offset_c = nil
    offset_d = nil

    shift_a = nil
    shift_b = nil
    shift_c = nil
    shift_d = nil
  end

  # Checker methods

  # The first two just check to see if our attributes initialize as nil
  # Probably make into their own module later
  # Messy but better than creating 4 unnecessary attr_readers
  def key_setup?
    if @key_a == @key_b &&
       @key_b == @key_c &&
       @key_c == @key_d &&
       @key_d == nil
      true
    else
      false
    end
  end

  # if statement is pretty long
  def offset_setup?
    if @offset_a == @offset_b &&
       @offset_b == @offset_c &&
       @offset_c == @offset_d &&
       @offset_d == nil
      true
    else
      false
    end
  end

  # Return our keys as an array to use as a check
  # for our #encrypt method functionality
  def assign_key_check?
    [@key_a, @key_b, @key_c, @key_d]
  end

  # Same thing as method above, but for offset attributes
  def assign_offset_check?
    [@offset_a, @offset_b, @offset_c, @offset_d]
  end

  def assign_shift_check?
    [@shift_a, @shift_b, @shift_c, @shift_d]
  end

  # Helper Methods (should be able to fit in a module)
  # note : figure out a way later to make these return
  # arrays containing variables with our appropriate
  # values - will require arguments on #assign_shifts
  def assign_keys(key)
    @key_a = key[0..1]
    @key_b = key[1..2]
    @key_c = key[2..3]
    @key_d = key[3..4]
  end

  def assign_offsets(date)
    date_squared = date.to_i ** 2
    # Not DRY, but I'll refactor it later
    date_squared = date_squared.to_s

    # require 'pry'; binding.pry
    @offset_a = date_squared[-4].to_s
    @offset_b = date_squared[-3].to_s
    @offset_c = date_squared[-2].to_s
    @offset_d = date_squared[-1].to_s
  end

  def assign_shifts
    @shift_a = @key_a.to_i + @offset_a.to_i
    @shift_b = @key_b.to_i + @offset_b.to_i
    @shift_c = @key_c.to_i + @offset_c.to_i
    @shift_d = @key_d.to_i + @offset_d.to_i

    # Also not DRY for shit
    @shift_a = @shift_a.to_s
    @shift_b = @shift_b.to_s
    @shift_c = @shift_c.to_s
    @shift_d = @shift_d.to_s
  end

  def return_hash(encrypted_message)

    enc_hash = {
      encryption: encrypted_message,
      key: @key,
      date: @offsets

    }

  end


  # Actual Enigma functionality methods

  # Elementary encrypt method, will figure out encryption
  # first, then move to adding other required functional elements
  def encrypt(message, key, date)
      @message = message.downcase
      @key = key # Possible we don't even need this
      @offsets = date # Or this

      assign_keys(key)
      assign_offsets(date)
      assign_shifts

    encrypted_message = []

    message_as_array = message.split('')

    # Definitely not DRY lol
      shift_counter = 0

      message_as_array.each do |char|

        case shift_counter
        when 0
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shift_a.to_i)

          encrypted_message << shifted[relative_position]

          #require 'pry'; binding.pry
          shift_counter += 1

        when 1
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shift_b.to_i)

          encrypted_message << shifted[relative_position]

          #require 'pry'; binding.pry

          shift_counter += 1

        when 2
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shift_c.to_i)

          encrypted_message << shifted[relative_position]

          shift_counter += 1


        when 3
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shift_d.to_i)

          encrypted_message << shifted[relative_position]

          shift_counter = 0


        else
          puts "lol"
        end
      end

      return_hash(encrypted_message.join)

    end


  end
