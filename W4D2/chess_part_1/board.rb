require_relative "piece"

class Board

  attr_reader :rows
  def initialize
    # @sentinel = NullPiece
    @rows = Array.new(8) {Array.new(8, nil)}
    @queen1 = Piece.new(:white, @rows, [0, 4])
  end

  def [](pos)
  end

  def []=(pos, val)
  end

  def move_piece(color, start_pos, end_pos)

  end

  def valid_pos?(pos)

  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end
end
