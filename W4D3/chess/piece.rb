class Piece #parent of all the pieces 
  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos 
    
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    @pos.nil?
  end

  def valid_move?(x y)
    return false if !(0..7).include?(x) || !(0..7).include?(y)
    return false if !empty? && !opponent?(x, y)
    true
  end

  def opponent?(x,y)
    @color != @board[x, y].color 
  end 

  def pos=(val)
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
  end
end
