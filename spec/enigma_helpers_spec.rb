require './lib/enigma'
require './lib/enigma_helpers'
require 'simplecov'

SimpleCov.start

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'can #generate_key with leading 0 of length 5' do
    key = @enigma.generate_key
    expect(key.length).to eq(5)
  end

  it 'can #generate_date' do
    date = @enigma.generate_date
    expect(date).to eq("111321")
  end

  it 'can #assign_keys(key)' do
    key = "02715"
    expected = @enigma.assign_keys(key)

    expected_array = ["02", "27", "71", "15"]

    expect(expected).to eq(expected_array)
  end

  it 'can #assign_offsets(date)' do
    date = "040895"
    expected = @enigma.assign_offsets(date)
    expected_array = ["1", "0", "2", "5"]

    expect(expected).to eq(expected_array)
  end

  it 'can #assign_shifts' do
    keys_arr = @enigma.assign_keys("02715")
    offsets_arr = @enigma.assign_offsets("040895")

    expected = @enigma.assign_shifts(keys_arr, offsets_arr)
    expected_array = [3, 27, 73, 20]

    expect(expected).to eq(expected_array)
  end

  # Testing via nested functionality (e.g. within #encrypt)
  it 'can #return_hash' do
    expected_hash_one = {

      encryption: "keder ohulw",
      key: "02715",
      date: "040895"

    }
    expected_hash_two = {

      decryption: "hello world",
      key: "02715",
      date: "040895"

    }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash_one)
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected_hash_two)
  end




end
