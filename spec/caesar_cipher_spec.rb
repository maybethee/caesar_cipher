#spec/caesar_cipher_spec.rb
require './lib/caesar_cipher'

describe "#caesar_cipher" do

  it "shifts characters by the correct amount" do
    expect(caesar_cipher('Hello world', 16)).to match(/Xubbe mehbt/)
  end

  it "wraps all z's to a's" do
    expect(caesar_cipher('Zzzzz', 1)).to match(/Aaaaa/)
  end

  it "ignores punctuation" do
    expect(caesar_cipher('Hello world...?', 10)).to match(/Rovvy gybvn...?/)
  end
end

