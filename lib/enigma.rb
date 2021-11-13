class Enigma


  # TODO:
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

    key_a = nil
    key_b = nil
    key_c = nil
    key_d = nil

    offset_a = nil
    offset_b = nil
    offset_c = nil
    offset_d = nil
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

  # Helper Methods (should be able to fit in a module)



  # Actual Enigma functionality methods

  # Elementary encrypt method, will figure out encryption
  # first, then move to adding other required functional elements
  def encrypt(message, key, date)
    @message = message
    @key = key # Possible we don't even need this
    @offsets = date # Or this

    # Assign keys according to @key (should figure out better names)
    # Possible break this into helper method, returns array that gets stored as
    # an enigma attribute instead of having 4 keys attributes
    @key_a = key[0..1]
    @key_b = key[1..2]
    @key_c = key[2..3]
    @key_d = key[3..4]

    # Assign offsets
    # Definitely would want to break this into a module
  end


end
