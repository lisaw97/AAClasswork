require 'towers_of_hanoi'

RSpec.describe "TowersOfHanoi" do
  subject(:game) {TowersOfHanoi.new(3)}

  describe "#initialize" do
    it "initializes the tower arrays" do
      expect(game.towers).to eq([[1, 2, 3], [], []])
    end
  end

  describe "#move" do
    it "moves a disk from one tower to another, legally" do
      game.move(0, 1)
      game.move(0, 2)
      game.move(0, 2)
      expect(game.towers).to eq([[], [3], [2, 1]])
    end
  end

  describe "#won?" do
    it "return true if you successfully move all blocks to another tower in order" do
      game.move(0, 1) 
      game.move(0, 1) 
      game.move(0, 1) 
      game.move(1, 0) 
      game.move(1, 0) 
      game.move(1, 0)
      expect(game.won?).to be true
    end
  end

end