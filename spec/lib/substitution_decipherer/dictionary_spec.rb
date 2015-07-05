require "spec_helper"

describe SubstitutionDecipherer::Dictionary do
  let(:dictionary) { SubstitutionDecipherer::Dictionary.new }

  it "describes whether a word is in the dictionary" do
    expect(dictionary.include?("kangaroo")).to be true
    expect(dictionary.include?("awesome")).to  be true
    expect(dictionary.include?("heretic")).to  be true
    expect(dictionary.include?("monster")).to  be true
    expect(dictionary.include?("garbage")).to  be true
    expect(dictionary.include?("grabage")).to  be false
    expect(dictionary.include?("asdhf")).to    be false
  end
end
