require_relative "../stock_picker.rb"

RSpec.describe "stock_picker" do
  it "retourne le meilleur jour pour acheter et vendre pour un profit maximum" do
    result = stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
    expect(result).to eq([1, 4])
  end

  it "il n'est pas autorisé de vendre le premier jour ou d'acheter le dernier jour" do
    result = stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
    expect(result[0]).not_to eq(8)
    expect(result[1]).not_to eq(0)
  end

  it "retourne [0, 0] si pas de profit faisable" do
    result = stock_picker([1, 9, 8, 7])
    expect(result).to eq([0, 0])
  end
end
