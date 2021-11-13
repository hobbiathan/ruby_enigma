class Enigma

  attr_reader :message, :keys, :offsets, :char_set
  def initialize

    @message = nil
    @keys = nil
    @offsets = nil
    @char_set = ["a".."z"].to_a << " "


  end




end
