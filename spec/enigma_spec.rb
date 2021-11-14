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

  end

  context 'object methods' do

    it 'can #encrypted a message' do
      encrypted_hash = @enigma.encrypt("hello world", "02715", "040895")
      expect(encrypted_hash[:encryption]).to eq("keder ohulw")
    end

    it 'can #decrypt a message' do
      expected_hash = @enigma.decrypt("keder ohulw", "02715", "040895")
      expect(expected_hash[:decryption]).to eq("hello world")
    end

    it 'can #encrypt with no provided key or date' do
      my_hash = @enigma.encrypt("hello world")
      expect(my_hash.keys.size).to eq(3)
      expect(my_hash.values.size).to eq(3)
    end

  end
end
