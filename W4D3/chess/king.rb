require_relative 'stepable'
require_relative "piece"


class King < Piece 
  include Stepable
  
  def symbol
    ♚
  end

  protected 
  def move_dirs
    :king
  end
end