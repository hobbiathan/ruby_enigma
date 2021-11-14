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

  context '#encrypt/#decrypt' do

    it 'can #encrypt and return an appropriate hash' do
      expected_hash = {

        encryption: "keder ohulw",
        key: "02715",
        date: "040895"

      }

      encrypted_hash = @enigma.encrypt("hello world", "02715", "040895")
      expect(encrypted_hash).to eq(expected_hash)
    end

    it 'can #decrypt and return an appropriate hash' do
      expected_hash = {

        decryption: "hello world",
        key: "02715",
        date: "040895"

      }

      decrypted_hash = @enigma.decrypt("keder ohulw", "02715", "040895")
      expect(decrypted_hash).to eq(expected_hash)
    end

    it 'can #encrypt without provided date' do
      expected_hash = {

        encryption: "sgfazbqdbny",
        key: "02715",
        date: "111421"

      }

      encrypted_hash = @enigma.encrypt("hello world", "02715")
      expect(encrypted_hash).to eq(expected_hash)
    end

    it 'can #decrypt without provided date' do
      expected_hash = {

        decryption: "hello world",
        key: "02715",
        date: "111421"

      }
      decrypted_hash = @enigma.decrypt("sgfazbqdbny", "02715")
      expect(decrypted_hash).to eq(expected_hash)
    end

    it 'can #encrypt without proided date and key' do
      test_hash = @enigma.encrypt("hello world")
      expect(test_hash[:date]).to eq("111421")
      expect(test_hash.keys.size).to eq(3)
      expect(test_hash.values.size).to eq(3)
    end

  end
end
