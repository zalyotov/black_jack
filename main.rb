require_relative 'user'
require_relative 'player'
require_relative 'dealer'

class Main
  def main_menu
    puts "Введите Ваше имя"
    name = gets.chomp
    player = Player.new(name)
    dealer = Dealer.new
  end
end

app = Main.new
app.main_menu