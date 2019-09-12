require_relative 'slideable'
require_relative "piece"

class Rook < Piece 
  include Slideable 
  
  def symbol
    ♜
  end

  protected 
  def move_dirs
    [:H]
  end
end