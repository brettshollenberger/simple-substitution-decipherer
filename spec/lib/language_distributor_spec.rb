require "spec_helper"

describe LanguageDistributor do
  let(:distributor) { LanguageDistributor.new }

  it "saves records of character counts it has read" do
    expect(distributor).to receive(:save).with({
      "a" => 0,
      "b" => 0,
      "c" => 0,
      "d" => 1,
      "e" => 1,
      "f" => 0,
      "g" => 0,
      "h" => 1,
      "i" => 0,
      "j" => 0,
      "k" => 0,
      "l" => 3,
      "m" => 0,
      "n" => 0,
      "o" => 2,
      "p" => 0,
      "q" => 0,
      "r" => 1,
      "s" => 0,
      "t" => 0,
      "u" => 0,
      "v" => 0,
      "w" => 1,
      "x" => 0,
      "y" => 0,
      "z" => 0
    }, 10)

    distributor.process "hello world"
  end
end
