require_relative "board"

class Cursor
  attr_reader :board, :cursor_pos, :selected

  def initialize(cursor_pos, board)
  end

  def get_input

  end

  def toggle_selected
  end

  private

  def handle_key(key)
  end

  def read_char
  end

  def update_pos(diff)

  end
end