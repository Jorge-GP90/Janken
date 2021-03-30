class Player
  def hand
    p "Please enter a number:"
    p "0: Goo, 1: Choki, 2: Par"
    input_hand = gets.chomp
    case input_hand
    when /\D/, ""
      p "invalid input, try again."
      return hand
    when "0"
      p "Goo"
      return input_hand
    when "1"
      p "choki"
      return input_hand
    when "2"
      p "par"
      return input_hand
    else
      p "Wrong number , try agian"
      return hand
    end
  end
end
class Enemy
  def hand
    puts "Now your Enemy is choosing..."
    enemy_input = rand(3)
    if enemy_input == 0
      p "Goo"
      return enemy_input
    elsif enemy_input == 1
      p "choki"
      return enemy_input
    else
      p "par"
      return enemy_input
    end
  end
end
class Janken
  def pon(input_hand, enemy_input)
    janken = ["Goo", "Choki", "Par"]
    puts "The opponent's hand is #{janken [enemy_input]}."
    if input_hand.to_i == enemy_input
      puts "Aiko"
      return true
    elsif (input_hand.to_i == 0 && enemy_input == 1) || (input_hand.to_i == 1 && enemy_input == 2) || (input_hand.to_i == 2 && enemy_input == 0)
      p "You win"
      return false
    else
      puts "you lost"
      return false
    end
  end
end
class Action
  def self.jankenpon
    player = Player.new
    enemy = Enemy.new
    janken = Janken.new
    next_game = true
    while next_game
      next_game = janken.pon(player.hand, enemy.hand)
    end
  end
end
Action.jankenpon
