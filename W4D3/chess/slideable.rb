module Slideable
  HORIZONTAL_DIRS = [[1, 0], [-1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[-1,1], [1,-1], [-1,-1], [1,1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs  
    DIAGONAL_DIRS
  end 

  def moves 
    all_possible_moves = []
    move_dirs.each do |dir|
      if move_dirs == :H 
        HORIZONTAL_DIRS.each {|dir| all_possible_moves << grow_unblocked_moves_in_dir(dir)}
      elsif move_dirs == :D 
        DIAGONAL_DIRS.each {|dir| all_possible_moves << grow_unblocked_moves_in_dir(dir)}
      end
    end
    all_possible_moves 
  end 

  private 

  def move_dirs 
    #return :h / :d / :both in subclass
  end

  def grow_unblocked_moves_in_dir(dx, dy) 
    x_var = self.pos[0]
    y_var = self.pos[1]
    considered_moves = []

    until !valid_move?(x_var, y_var)
        x_var += dx
        y_var += dy
        considered_moves << [x_var, y_var]
    end
    considered_moves 
  end 

end