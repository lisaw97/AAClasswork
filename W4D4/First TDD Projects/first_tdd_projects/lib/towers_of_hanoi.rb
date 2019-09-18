class TowersOfHanoi

  attr_reader :towers, :size


  def initialize(size)
    @towers = Array.new(size) {Array.new}
    @towers[0] = (1..size).to_a
    @size = size
    run
  end

  def run
    until won?
      puts "Enter 2 numbers representing where you want the disc to move from and move to"
      input = gets.chomp.split 
      input.map! {|num| num.to_i}
      move(input[0], input[1])
    end
  end

  def move(from, to)
    towers[to] << towers[from].pop
  end

  def won?
    @towers.any? {|tower| tower == (1..size).to_a}
  end
end