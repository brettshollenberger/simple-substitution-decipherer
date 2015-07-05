require "spec_helper"

describe SubstitutionDecipherer do
  let(:encipherer) { Encipherer.new(shift: 5)   }
  let(:decipherer) { SubstitutionDecipherer.new }

  it "guesses at the enchiper encoding" do
    messages = ["hello world", "what is this world coming to?", "what is the message?"]

    messages.each do |message|
      input = encipherer.encipher message

      expect(decipherer.decipher input).to eq message
    end
  end
end
