class Enigma

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

  # Helper Methods (should be able to fit in a module)


  # Actual functional methods

  def encrypt(message, key, date)
    @message = message


    @key = key
    @offsets = date
  end

end
