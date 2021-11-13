require './lib/enigma'
require 'simplecov'

SimpleCov.start

RSpec.describe Enigma do

  before(:each) do
    @enigma = Enigma.new
  end

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
