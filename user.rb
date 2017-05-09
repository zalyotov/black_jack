class User
  attr_accessor :bank, :count, :cards
  attr_reader :name

  def initialize(*name)
    @name = name
    @cards = []
    @count = 0
  end

  def give_money(bet)
    @bank -= bet if @bank >= bet
    bet
  end
end