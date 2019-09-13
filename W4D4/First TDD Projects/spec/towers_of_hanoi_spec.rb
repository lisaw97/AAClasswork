require 'towers_of_hanoi'

RSpec.describe "TowersOfHanoi" do
  subject(:game) {TowersOfHanoi.new}
  describe "#initialize" do
    it "initializes the tower arrays" do
      expect(game.towers[0]).to eq((1..5).to_a)
      expect(game.towers[1]).to be_empty
      expect(game.towers[2]).to be_empty
    end
    
  end

  describe "#move" do
    it "moves a disk from one tower to annother, legally" do
      expect(game.move(tow1,tow2)).to eq()
    
  end

  describe "#won?" do
    
  end

end