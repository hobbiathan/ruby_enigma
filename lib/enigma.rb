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
    @char_set = ["a".."z"].to_a << " "

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


  # Actual Enigma functionality methods

  # Elementary encrypt method, will figure out encryption
  # first, then move to adding other required functional elements
  def encrypt(message, key, date)
    @message = message
    @key = key # Possible we don't even need this
    @offsets = date # Or this


    # Note: Definitely break the logic below into Helpers

    # Assign keys according to @key (should figure out better names)
    # Possible break this into helper method, returns array that gets stored as
    # an enigma attribute instead of having 4 keys attributes

    # assign_keys(key)
    # have it return key variables in an array
    @key_a = key[0..1]
    @key_b = key[1..2]
    @key_c = key[2..3]
    @key_d = key[3..4]

    # Assign offsets
    # Definitely would want to break this into a module
    # Possible it's be better to keep these all as integers

    # assign_offsets(date)
    # Have it return offset variables within an array
    date_squared = date.to_i ** 2
    # Not DRY, but I'll refactor it later
    date_squared = date_squared.to_s

    # require 'pry'; binding.pry
    @offset_a = date_squared[-4].to_s
    @offset_b = date_squared[-3].to_s
    @offset_c = date_squared[-2].to_s
    @offset_d = date_squared[-1].to_s


    # assign_shifts(key_arr, offset_arr)
    # would take key array and offset array as arguments
    # returns array with shift variables

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


end
