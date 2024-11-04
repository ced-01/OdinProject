# frozen_string_litteral: true

require_relative "../caesar_cipher"

# 1_"noobs" mode
# RSpec.describe "Convert to Ascii" do
#   it "Conversion alphabet to ascii exept specials characters" do
#     expect(convert_to_ascii("abcABC>?@")).to eq([97, 98, 99, 65, 66, 67, 62, 63, 64])
#   end
# end

# #2_ Rspec.describe "left_shift" do
#       ...etc...
#     end
# # 3 idem
# # 4 idem

# Pro - mode

RSpec.describe "caesar_cipher" do
  describe "#convert_to_ascii" do
    it "converts a string to an array of ASCII values" do
      expect(convert_to_ascii("abc")).to eq([97, 98, 99])
    end

    it "handles empty strings" do
      expect(convert_to_ascii("")).to eq([])
    end

    it "converts special characters correctly" do
      expect(convert_to_ascii("!@#")).to eq([33, 64, 35])
    end
  end

  describe "#left_shift" do
    it "shifts each ASCII value correctly with positive shift" do
      arr_ascii = [97, 98, 99] # 'a', 'b', 'c'
      expect(left_shift(arr_ascii, 1)).to eq([98, 99, 100])
    end

    it "shifts each ASCII value correctly with negative shift" do
      arr_ascii = [98, 99, 100] # 'b', 'c', 'd'
      expect(left_shift(arr_ascii, -1)).to eq([97, 98, 99])
    end

    it "does not shift non-alphabetic characters" do
      arr_ascii = [33, 64, 35] # '!', '@', '#'
      expect(left_shift(arr_ascii, 5)).to eq([33, 64, 35])
    end
  end

  describe "#convert_to_letter" do
    it "converts shifted ASCII values back to a string" do
      arr_shifted = [98, 99, 100] # 'b', 'c', 'd'
      expect(convert_to_letter(arr_shifted)).to eq("bcd")
    end
  end

  describe "#caesar_cipher" do
    it "encodes a simple string with a positive shift" do
      expect(caesar_cipher("abc", 1)).to eq("bcd")
    end

    it "encodes with a negative shift" do
      expect(caesar_cipher("bcd", -1)).to eq("abc")
    end

    it "handles shifts that wrap around the alphabet" do
      expect(caesar_cipher("xyz", 3)).to eq("abc")
    end

    it "keeps non-alphabetic characters unchanged" do
      expect(caesar_cipher("a!b@c", 1)).to eq("b!c@d")
    end
  end
end
