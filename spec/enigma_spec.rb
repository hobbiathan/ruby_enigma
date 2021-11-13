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
    expect(@enigma.keys).to eq(nil)
  end

  it 'initializes empty offsets' do
    expect(@enigma.offsets).to eq(nil)
  end

  it 'initializes empty message' do
    expect(@enigma.message).to eq(nil)
  end


end
