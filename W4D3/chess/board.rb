# require_relative "piece"
require_relative "rook"
require_relative "bishop"
require_relative "knight"
require_relative "queen"
require_relative "king"
require_relative "pawn"
require_relative "null_piece"

class Board

  attr_reader :grid
  def initialize
    # @sentinel = NullPiece
    @grid = Array.new(8) {Array.new(8, nil)}
    populate_board
    # pieces = 
    # @rook1w = Piece.new(:white, @rows, [0,0]) 
    # @knight1w = Piece.new(:white, @rows, [1,0]) 
    # @bishop1w = Piece.new(:white, @rows, [2,0]) 
    # @queenw = Piece.new(:white, @rows, [3, 0])
    # @kingw = Piece.new(:white, @rows, [4,0]) 
    # @bishop2w = Piece.new(:white, @rows, [5,0]) 
    # @knight2w = Piece.new(:white, @rows, [6,0])  
    # @rook2w = Piece.new(:white, @rows, [7,0]) 
    # @pawn1w = Piece.new(:white, @rows, [0,1])
    # @pawn2w = Piece.new(:white, @rows, [1,1])
    # @pawn3w = Piece.new(:white, @rows, [2,1])
    # @pawn4w = Piece.new(:white, @rows, [3,1])
    # @pawn5w = Piece.new(:white, @rows, [4,1])
    # @pawn6w = Piece.new(:white, @rows, [5,1])
    # @pawn7w = Piece.new(:white, @rows, [6,1])
    # @pawn8w = Piece.new(:white, @rows, [7,1])

    # @rook1b = Piece.new(:black, @rows, [0,7]) 
    # @knight1b = Piece.new(:black, @rows, [1,7]) 
    # @bishop1b = Piece.new(:black, @rows, [2,7]) 
    # @queenb = Piece.new(:black, @rows, [3,7])
    # @kingb = Piece.new(:black, @rows, [4,7]) 
    # @bishop2b = Piece.new(:black, @rows, [5,7]) 
    # @knight2b = Piece.new(:black, @rows, [6,7])  
    # @rook2b = Piece.new(:black, @rows, [7,7]) 
    # @pawn1b = Piece.new(:black, @rows, [0,6])
    # @pawn2b = Piece.new(:black, @rows, [1,6])
    # @pawn3b = Piece.new(:black, @rows, [2,6])
    # @pawn4b = Piece.new(:black, @rows, [3,6])
    # @pawn5b = Piece.new(:black, @rows, [4,6])
    # @pawn6b = Piece.new(:black, @rows, [5,6])
    # @pawn7b = Piece.new(:black, @rows, [6,6])
    # @pawn8b = Piece.new(:black, @rows, [7,6])
    

    #pieces.each { |piece| self[piece.pos] = piece }

  end

  def populate_board
    (0..7).each do |x|
      (0..7).each do |y|
        pos = [x,y]
        
        self[pos] = Rook.new if (x == 0 || x == 7) && (y == 0 || y == 7)
        self[pos] = Knight.new if (x == 1 || x == 6) && (y == 0 || y == 7)
        self[pos] = Bishop.new if (x == 2 || x == 5) && (y == 0 || y == 7)
        self[pos] = Queen.new if x == 3 && (y == 0 || y == 7)
        self[pos] = King.new if x == 4 && (y == 0 || y == 7)
        self[pos] = Pawn.new if y == 1 || y == 6
      end
    end
  end

  def [](pos)
    row, col = pos 
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos 
    @grid[row][col] = val
  end

  def render
    @grid.each do |row|
      puts row.join(" ")
    end
  end

  def move_piece(start_pos, end_pos)
    raise "invalid start position" if !valid_pos?(start_pos) || self[start_pos] == nil
    raise "invalid end position" if !valid_pos?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def valid_pos?(pos)
    row, col = pos 
    return false if !(0..7).include?(row) || !(0..7).include?(col)
    true 
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
