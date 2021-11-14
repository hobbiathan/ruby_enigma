require './lib/enigma'
require './lib/enigma_helpers'

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

  it 'can #assign_keys(key) via #encrypt' do
    key = "02715"
    @enigma.assign_keys(key)
    @enigma.encrypt("hello world", "02715", "040895")
    expected_array = ["02", "27", "71", "15"]

    expect(@enigma.assign_key_check?).to eq(expected_array)
  end

  it 'can #assign_offsets(date) via #encrypt' do
    date = "040895"
    #require 'pry'; binding.pry
    @enigma.encrypt("hello world", "02715", "040895")
    expected_array = ["1", "0", "2", "5"]

    expect(@enigma.assign_offset_check?).to eq(expected_array)
  end

  it 'can #assign_shifts via #encrypt' do
    @enigma.encrypt("hello world", "02715", "040895")
    expected_array = [3, 27, 73, 20]

    expect(@enigma.assign_shift_check?).to eq(expected_array)
  end

  # Testing via nested functionality (e.g. within #encrypt)
  it 'can #return_hash' do
    expected_hash = {

      encryption: "keder ohulw",
      key: "02715",
      date: "040895"

    }
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected_hash)
  end




end
