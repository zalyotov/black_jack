class Game
  attr_accessor :players
  attr_reader :bet

  def initialize(*players)
    @bet = 10
    players.each do |player|
      @players ||= {}
      @players["#{player.class}"] = player
    end
  end
end