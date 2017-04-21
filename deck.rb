class Deck
  attr_reader :deck
  
  def initialize
    new_deck
  end

  def new_deck
    @default_deck = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    shuffle_deck    
  end

  def delete_card
    deck.delete_at(0)
  end

  private

  def shuffle_deck
    @deck ||= []
    @default_deck.each do |value|
      @deck << "#{value}\u{2660}" << "#{value}\u{2665}" << "#{value}\u{2666}" << "#{value}\u{2663}"
    end
    @deck.shuffle!
  end
end