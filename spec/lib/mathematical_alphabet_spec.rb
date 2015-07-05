require "spec_helper"

describe MathematicalAlphabet do

  let(:alphabet) { MathematicalAlphabet.new }

  it "shifts letters" do
    expect(alphabet.shift("a", 1)).to  eq "b"
    expect(alphabet.shift("a", 3)).to  eq "d"
    expect(alphabet.shift("a", 26)).to eq "a"
    expect(alphabet.shift("z", 1)).to  eq "a"
  end

  it "unshifts letters" do
    expect(alphabet.unshift("a", 1)).to  eq "z"
    expect(alphabet.unshift("b", 1)).to  eq "a"
  end
end
