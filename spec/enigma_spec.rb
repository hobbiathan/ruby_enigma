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
      expected_array = ["a".."z"].to_a << " "
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
  end

  context 'object methods' do

    it 'returns nil array via #assign_key_check?' do
      expected_array = [nil, nil, nil, nil]
      expect(@enigma.assign_key_check?).to eq(expected_array)
    end

    it 'returns nil array via #assign_offset_check?' do
      expected_array = [nil, nil, nil, nil]
      expect(@enigma.assign_offset_check?).to eq(expected_array)
    end

    end
    it 'can store message via #encrypt' do
      @enigma.encrypt("hello world", "02715", "111321")
      expect(@enigma.message).to eq("hello world")
    end

    it 'can store key via #encrypt' do
      @enigma.encrypt("hello world", "02715", "111321")
      expect(@enigma.key).to eq("02715")
    end

    it 'can store date via #encrypt' do
      @enigma.encrypt("hello world", "02715", "111321")
      expect(@enigma.offsets).to eq ("111321")
    end

    it 'can assign keys a..d using @key within #encrypt' do
      @enigma.encrypt("hello world", "02715", "111321")
      expected_array = ["02", "27", "71", "15"]

      expect(@enigma.assign_key_check?).to eq(expected_array)
    end

    it 'can assign offsets a..d using @date^2 within #encrypt' do
      @enigma.encrypt("hello world", "02715", "111321")
      expected_array = ["5", "0", "4", "1"]

      expect(@enigma.assign_offset_check?).to eq(expected_array)
    end

  end
