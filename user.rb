class User
  attr_accessor :money
  attr_reader :type, :name

  def initialize(*name)
    @name = name
    @money = 100
  end

  def give_money(bet)
    @money -= bet if @money >= 10
  end
end