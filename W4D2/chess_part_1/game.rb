require_relative "display"
require_relative "player"
require_relative "board"

class Game

  attr_reader :board, :display, :players, :current_player

  def initialize
  end

  def play
  end

  private 

  def notify_players
  end

  def swap_turn!
  end

end