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

    xit 'initializes empty keys' do
      expect(@enigma.key).to eq(nil)
    end

    xit 'initializes empty offsets' do
      expect(@enigma.offsets).to eq(nil)
    end

    xit 'initializes empty message' do
      expect(@enigma.message).to eq(nil)
    end

    xit 'initializes nil a..d keys via #key_setup?' do
      expect(@enigma.key_setup?).to be true
    end

    xit 'initializes nil a..d offsets via #offset_setup?' do
      expect(@enigma.offset_setup?).to be true
    end

    xit 'initializes nil a..d shifts via #shifts_setup?' do
      expect(@enigma.shifts_setup?).to be true
    end
  end

  context 'checker methods' do
    xit 'returns nil array via #assign_key_check?' do
      expected_array = []
      expect(@enigma.assign_key_check?).to eq(expected_array)
    end

    xit 'returns nil array via #assign_offset_check?' do
      expected_array = []
      expect(@enigma.assign_offset_check?).to eq(expected_array)
    end

    xit 'returns nil array via #assign_shift_check?' do
      expected_array = []
      expect(@enigma.assign_shift_check?).to eq(expected_array)
    end
  end

  context 'object methods' do

    xit 'can store message via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.message).to eq("hello world")
    end

    xit 'can store key via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.key).to eq("02715")
    end

    xit 'can store date via #encrypt' do
      @enigma.encrypt("hello world", "02715", "040895")
      expect(@enigma.offsets).to eq ("040895")
    end

    it 'can #encrypted a message' do
      encrypted_hash = @enigma.encrypt("hello world", "02715", "040895")
      expect(encrypted_hash[:encryption]).to eq("keder ohulw")
    end

    it 'can #decrypt a message' do
      expected_hash = @enigma.decrypt("keder ohulw", "02715", "040895")
      expect(expected_hash[:decryption]).to eq("hello world")

    end

  end
end
