require_relative 'user'
require_relative 'player'
require_relative 'dealer'
require_relative 'game'

class Main

  attr_accessor :game

  def main_menu
    puts "1. Начать игру\r\n0. Выход"
    input = gets.chomp.to_i

    loop do
      case input
      when 1
        create_game
      when 0
        abort
      else
        puts 'Введите число от 0 до 8'
      end
    end
  end

  def create_game
    puts "Введите Ваше имя"
    name = gets.chomp
    player = Player.new(name)
    dealer = Dealer.new
    game = Game.new(player, dealer)
  end
end

app = Main.new
app.main_menu