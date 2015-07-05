require "spec_helper"

describe Encipherer do
  let(:encipherer) { Encipherer.new(shift: 5) }

  it "shifts messages" do
    expect(encipherer.encipher "hello world").to eq "mjqqt btwqi"
  end
end
