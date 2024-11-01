require_relative "../bubble_sort.rb"

RSpec.describe "bubble_sort" do
  it "retourne un tableau dans l'ordre croissant" do
    result = bubble_sort([4, 3, 78, 2, 0, 2])
    expect(result).to eq([0, 2, 2, 3, 4, 78])
  end
end
