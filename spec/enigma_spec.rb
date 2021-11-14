require './lib/enigma'
require 'simplecov'

SimpleCov.start

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  context 'object initialization' do
    it 'exists' do
      expect(@enigma).to be_instance_of(Enigma)
    end

    it 'initializes empty char_set' do
      expected_array = ("a".."z").to_a << " "
      expect(@enigma.char_set).to eq(expected_array)
    end

    it 'initializes empty keys' do
      expect(@enigma.key).to eq(nil)
    end

    it 'initializes empty offsets' do
      expect(@enigma.offsets).to eq(nil)
    end

    it 'initializes empty message' do
      expect(@enigma.message).to eq(nil)
    end

    it 'initializes nil a..d keys via #key_setup?' do
      expect(@enigma.key_setup?).to be true
    end

    it 'initializes nil a..d offsets via #offset_setup?' do
      expect(@enigma.offset_setup?).to be true
    end

    it 'initializes nil a..d shifts via #shifts_setup?' do
      expect(@enigma.shifts_setup?).to be true
    end
  end

  context 'checker methods' do
    it 'returns nil array via #assign_key_check?' do
      expected_array = []
      expect(@enigma.assign_key_check?).to eq(expected_array)
    end

    it 'returns nil array via #assign_offset_check?' do
      expected_array = []
      expect(@enigma.assign_offset_check?).to eq(expected_array)
    end

    it 'returns nil array via #assign_shift_check?' do
      expected_array = []
      expect(@enigma.assign_shift_check?).to eq(expected_array)
    end
  end

  # context 'helper methods' do
  #   it 'can #assign_keys(key)' do
  #     key = "02715"
  #     @enigma.assign_keys(key)
  #     expected_array = ["02", "27", "71", "15"]
  #
  #     expect(@enigma.assign_key_check?).to eq(expected_array)
  #   end
  #
  #   it 'can #assign_offsets(date)' do
  #     date = "040895"
  #     @enigma.assign_offsets(date)
  #     expected_array = ["1", "0", "2", "5"]
  #
  #     expect(@enigma.assign_offset_check?).to eq(expected_array)
  #   end
  #
  #   it 'can #assign_shifts' do
  #     @enigma.encrypt("hello world", "02715", "040895")
  #     @enigma.assign_shifts
  #     expected_array = [3, 27, 73, 20]
  #
  #     expect(@enigma.assign_shift_check?).to eq(expected_array)
  #   end
  #
  #   # Testing via nested functionality (e.g. within #encrypt)
  #   it 'can #return_hash' do
  #     expected_hash = {
  #
  #       encryption: "keder ohulw",
  #       key: "02715",
  #       date: "040895"
  #
  #     }
  #     expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash)
  #   end
  # end

  context 'object methods' do

    it 'can store message via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.message).to eq("hello world")
    end

    it 'can store key via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.key).to eq("02715")
    end

    it 'can store date via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.offsets).to eq ("040895")
    end

    it 'can return encrypted message' do
      encrypted_hash = @enigma.encrypt("hello world", "02715", "040895")
      expect(encrypted_hash[:encryption]).to eq("keder ohulw")
    end


  end
end
