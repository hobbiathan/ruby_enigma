require_relative 'enigma_helpers'

class Enigma
  include EnigmaHelpers

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


    @keys_array = []
    @offsets_array = []
    @shifts_array = []
  end

  # Initialize checker methods

  # The first two just check to see if our attributes initialize as nil
  # Probably make into their own module later
  # Messy but better than creating 4 unnecessary attr_readers

  # Not dry in the slightest
  #
  def key_setup?
    if @keys_array == []
      true
    else
      false
    end
  end

  # if statement is pretty long
  # offset_setup?(@offsets_array)
  def offset_setup?
    if @offsets_array == []
      true
    else
      false
    end
  end

  # shifts_setup?(@shifts_array)
  def shifts_setup?
    if @shifts_array == []
      true
    else
      false
    end
  end

  # Return our keys as an array to use as a check
  # for our #encrypt method functionality
  # [keys_array[0], keys_array[1], etc...]
  def assign_key_check?
    @keys_array[0..3]
  end

  # Same thing as method above, but for offset attributes
  def assign_offset_check?
    @offsets_array[0..3]
  end

  def assign_shift_check?
    @shifts_array[0..3]
  end

  # Actual Enigma functionality methods

  # Elementary encrypt method, will figure out encryption
  # first, then move to adding other required functional elements
  def encrypt(message, key, date)
      @message = message.downcase
      @key = key # Possible we don't even need this
      @offsets = date # Or this


      @keys_array = assign_keys(key)
      @offsets_array = assign_offsets(date)
      @shifts_array = assign_shifts(@keys_array, @offsets_array)

    encrypted_message = []

    message_as_array = message.split('')

    # Definitely not DRY lol
      shift_counter = 0

      message_as_array.each do |char|

        case shift_counter
        when 0
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shifts_array[shift_counter])

          encrypted_message << shifted[relative_position]

          #require 'pry'; binding.pry
          shift_counter += 1

        when 1
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shifts_array[shift_counter])

          encrypted_message << shifted[relative_position]

          #require 'pry'; binding.pry

          shift_counter += 1

        when 2
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shifts_array[shift_counter])

          encrypted_message << shifted[relative_position]

          shift_counter += 1


        when 3
          relative_position = @char_set.index(char)
          shifted = @char_set.rotate(@shifts_array[shift_counter])

          encrypted_message << shifted[relative_position]

          shift_counter = 0


        else
          puts "lol"
        end
      end

      return_hash(encrypted_message.join)
      #require 'pry'; binding.pry
    end


  end
