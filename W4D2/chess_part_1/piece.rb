class Piece #parent of all the pieces 
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
  end
end
