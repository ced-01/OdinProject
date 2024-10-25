require_relative "../substrings.rb"

RSpec.describe "#substrings" do
  let(:dictionary) { ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"] }

  it "returns a hash of substrings found with their counts" do
    result = substrings("Howdy partner, sit down! How's it going?", dictionary)
    expect(result).to eq({
      "how" => 2,
      "howdy" => 1,
      "partner" => 1,
      "part" => 1,
      "i" => 3,
      "sit" => 1,
      "down" => 1,
      "go" => 1,
      "going" => 1,
      "it" => 2,
      "own" => 1,
    })
  end

  it "returns an empty hash if no words are found" do
    result = substrings("Zebra jumps over a fence", dictionary)
    expect(result).to eq({})
  end

  it "is case insensitive" do
    result = substrings("HOWDY PARTNER", dictionary)
    expect(result).to include("howdy" => 1, "partner" => 1)
  end

  it "returns counts of overlapping words" do
    result = substrings("go go going", dictionary)
    expect(result).to eq({
      "go" => 3,
      "going" => 1,
      "i" => 1,
    })
  end
end
