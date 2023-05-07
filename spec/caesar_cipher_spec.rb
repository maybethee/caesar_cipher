#spec/caesar_cipher_spec.rb
require './lib/caesar_cipher'

describe "#caesar_cipher" do
  it "wraps all z's to a's" do
    expect(caesar_cipher('zzzzz', 1)).to match(/Aaaaa/)
  end

  it ""
end