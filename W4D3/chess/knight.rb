require_relative 'stepable'
require_relative "piece"


class Knight < Piece 
  include Stepable
  
  def symbol
    ♞
  end

  protected 
  def move_dirs
    :knight
  end
end