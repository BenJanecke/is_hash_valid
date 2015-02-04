require 'spec_helper'
require './lib/is_hash_valid/version.rb'

describe "Version" do
  it { expect(IsHashValid::VERSION).to eq("1.1.1") }
end