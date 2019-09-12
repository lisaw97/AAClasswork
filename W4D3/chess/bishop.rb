require_relative 'slideable'
require_relative "piece"




class Bishop < Piece 
  include Slideable 
  
  def symbol
    ♝
  end

  protected 
  def move_dirs
    [:D]
  end
end