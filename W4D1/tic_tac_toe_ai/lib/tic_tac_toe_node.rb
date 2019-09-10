require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # return true if @board.over? && @board.winner != evaluator
    # return false if @board.over? && @board.winner.nil? 
    # children.all? {|child| losing_node?(@next_mover_mark)} || children.any? {|child| losing_node?(other_marker)}
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0...3).each do |i|
      (0...3).each do |j|
        if @board.empty?([i, j])
          c
          hildren << 
        end
      end
    end
    children
  end

  def other_marker
    return :x if @next_mover_mark == :o
    return :o if @next_mover_mark == :x
  end
end
