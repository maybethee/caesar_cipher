#spec/caesar_cipher_spec.rb
require './lib/caesar_cipher'

describe '#caesar_cipher' do

  it 'shifts characters by the correct amount' do
    expect(caesar_cipher('Hello world', 16)).to match(/Xubbe mehbt/)
  end

  it 'shifts the opposite direction with a negative shift factor' do
    expect(caesar_cipher('Hello world', -2)).to match(/Fcjjm umpjb/)
  end

  it "wraps all z's to a's" do
    expect(caesar_cipher('Zzzzz', 1)).to match(/Aaaaa/)
  end

  it "wraps a's to z's when using negative shift factor" do
    expect(caesar_cipher('Aaaaa', -2)).to match(/Yyyyy/)
  end

  it 'ignores punctuation' do
    expect(caesar_cipher('Hello world...?', 10)).to match(/Rovvy gybvn...?/)
  end

  it "doesn't break with a shift factor over 25" do
    expect(caesar_cipher('Hello world', 26)).to match(/Hello world/)
  end

  it "doesn't break with a shift factor over 26" do
    expect(caesar_cipher('Hello world', 27)).to match(/Ifmmp xpsme/)
  end
end

