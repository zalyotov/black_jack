require_relative 'user'
require_relative 'player'
require_relative 'dealer'
require_relative 'game'
require_relative 'deck'

class Main

  attr_accessor :game, :deck

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

  def game_menu
    current_step_info
    puts "\r\n1. Пропустить ход"
    puts '2. Добавить карту'
    puts '3. открыть карты'
    print "\r\nВаш выбор:"
    case gets.chomp.to_i
      when 1
        dealer_move
        game_menu
      when 2
        game.player.cards << deck.take_card
        open_cards if player_count > 21
        # print system('reset')
        game_menu
      when 3
        open_cards
        # print system('reset')
        # continue_game
      else
        puts 'Повторите ввод'
        game_menu
    end
  end

  def create_game
    puts "Введите Ваше имя"
    name = gets.chomp
    if name.length > 0
      player = Player.new(name)
      dealer = Dealer.new
      @game = Game.new(player, dealer)
      @deck = Deck.new
      @game.take_bank
      2.times {|time|
        game.dealer.cards << deck.take_card
        game.player.cards << deck.take_card
      }
      game_menu
    end
  end

  def current_step_info
    puts "\r\n\r\nСтавки сделаны, банк: #{game.bank}"
    puts "Остаток у дилера: #{game.dealer.bank}"
    puts "Карты дилера: #{game.dealer.cards.join(", ")}, очки: #{dealer_count}\r\n"
    puts "Ваш остаток: #{game.player.bank}"
    puts "Ваши карты: #{game.player.cards.join(", ")}, очки: #{player_count}\r\n"
  end

  def dealer_move
    if dealer_need_card?
      puts 'Дилер берет карту'
      game.dealer.cards << deck.take_card
    else
      puts 'Дилер пропускает ход' unless dealer_need_card?
    end
  end

  def dealer_need_card?
    game.dealer.count + game.counter([] << deck.take_card) < 21
  end

  def dealer_count
    game.dealer.count = game.counter(game.dealer.cards)
  end

  def player_count
    game.player.count = game.counter(game.player.cards)
  end

  def open_cards
    puts "Карты дилера: #{game.dealer.cards.join(", ")}, очки: #{dealer_count}\r\n"
    puts "Ваши карты: #{game.player.cards.join(", ")}, очки: #{player_count}\r\n"
    if player_count > dealer_count && player_count <= 21
      game.player.bank += game.bank
      puts "Поздравляю, вы выиграли"
    elsif dealer_count > player_count && dealer_count <= 21
      game.dealer.bank += game.bank
      puts "К вашему сожалению выиграл дилер"
    elsif player_count == dealer_count
      puts "Ничья, выигрыш делится пополам"
      advantage = game.bank / 2
      game.dealer.bank += advantage
      game.player.bank += advantage
    end    
    puts "Ваш остаток: #{game.player.bank}"
    puts "Остаток у дилера: #{game.dealer.bank}"
    game.bank = 0
  end

end

app = Main.new
app.main_menu