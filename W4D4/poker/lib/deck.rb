require_relative 'card'


class Deck

  attr_reader :deck

  def initialize
    @deck = populate_deck
  end

  def populate_deck
    card_vals = (2..10).to_a + %w(J Q K A)
    card_suits = %w(C S H D)

    card_suits.each do |suit|
      card_vals.each do |val|
        @deck << Card.new(suit, val)
      end
    end
    @deck.shuffle
  end

  def draw_card
    @deck.shift
  end
  
end