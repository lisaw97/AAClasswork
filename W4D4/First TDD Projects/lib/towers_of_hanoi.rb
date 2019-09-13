class TowersOfHanoi

  attr_reader :towers


def initialize
@towers = Array.new(3) {Array.new}
towers[0] = (1..5).to_a
end



end