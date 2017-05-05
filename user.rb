class User
  attr_accessor :bank, :count
  attr_reader :type, :name, :cards

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