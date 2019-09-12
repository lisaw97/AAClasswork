module Stepable
  KNIGHT_MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  KING_MOVES = [[1, 0], [-1,0], [0,1], [0,-1], [-1,1], [1,-1], [-1,-1], [1,1]]

  def moves
    move_diffs
  end 

  private 

  def move_diffs 
    x_var, y_var = self.pos[0], self.pos[1]
    considered_moves = []

    if move_dirs == :king 
      arr = KING_MOVES
    else
      arr = KNIGHT_MOVES
    end
      
    arr.map do |pos|
      if valid_move?(x_var + pos[0], y_var + pos[1])
        pos = [x_var + pos[0], y_var + pos[1]]
      end
    end
  end

end