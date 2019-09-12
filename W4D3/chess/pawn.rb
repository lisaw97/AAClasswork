require_relative "piece"
class Pawn < Piece 
  
  def symbol
    ♟
  end

 
  def move_dirs
    #all possible moves
    forward_steps + side_attacks
  end

  private

  def at_start_row?
    y == 6 || y == 1
  end

  def forward_dir
    return -1 if y == 6
    return 1 if y == 1
  end

  def forward_steps
    x_var, y_var = self.pos[0], self.pos[1]
    steps = []
    if at_start_row? 
      steps << [x_var, y_var - 2] if y == 6 
      steps << [x_var, y_var + 2] if y == 1   
    else
      steps << [x_var, y_var + forward_dir] if valid_move?(x_var, y_var + forward_dir)
    end
    steps
  end

  def side_attacks
    x_var, y_var = self.pos[0], self.pos[1]
    attacks = []
    if self.color == :white
      attacks << [x_var -1, y_var + 1] if opponent?(x_var -1, y_var + 1)
      attacks << [x_var -1, y_var + 1] if opponent?(x_var -1, y_var + 1)
    else 
      attacks << [x_var - 1, y_var - 1] if opponent?(x_var - 1, y_var - 1)
      attacks << [x_var + 1, y_var - 1] if opponent?(x_var + 1, y_var - 1)
    end
    attacks
  end

end