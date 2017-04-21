class User
  attr_accessor :money
  attr_reader :type, :name, :bet

  def initialize(*name)
    @name = name
    @money = 100
    @bet = 10
  end

  def give_money
    @money -= bet if @money >= 10
  end
end