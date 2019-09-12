require_relative 'slideable'
require_relative "piece"

class Queen < Piece 
  include Slideable 
  
  def symbol
    ♛
  end

  protected 
  def move_dirs
    [:H, :D]
  end
end