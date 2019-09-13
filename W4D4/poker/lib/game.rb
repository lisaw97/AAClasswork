
class Game
  
  def initialize
    @deck = Deck.new
    @hand = Hand.new(draw_cards(5))
  end
  
  def draw_cards(n)
    n.times do 
      @hand << @deck.draw_card
    end
  end

end