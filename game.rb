class Game
  attr_accessor :players, :bank
  attr_reader :bet, :default_bank

  def initialize(*players)
    @bank = 0
    @bet = 10
    @default_bank = 100
    players.each do |player|
      player.bank = default_bank
      @players ||= {}
      @players["#{player.class}"] = player
    end
  end

  def take_bank
    self.bank += self.player.give_money(bet)
    self.bank += self.dealer.give_money(bet)
  end

  def dealer
    players["Dealer"]
  end

  def player
    players["Player"]
  end

  def counter(cards)
    count ||= 0
    cards.each do |card|
      count += card.to_i unless card.to_i.zero?
      count += 10 if card.to_i.zero?
      count += 1 if count >= 10 && ace?(card)
      count += 11 if count <= 10 && ace?(card)
    end
    count
  end

  def ace?(card)
    card[0].to_sym == :A
  end
end