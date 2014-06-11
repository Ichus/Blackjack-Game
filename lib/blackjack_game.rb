require "deck"
require "player"
require "dealer"
require "round"

# This class sets up the blackjack game and iterates through rounds
# holding the player's progress, and determines when the game ends
class BlackjackGame
  # Only for testing
  attr_reader :player

  def initialize
    @deck = Deck.new(3)
    @deck.shuffle
    @dealer = Dealer.new(@deck)
    @player = Player.new(@deck)
    @round = Round.new(@deck, @player, @dealer)
  end

  # Starts the game and enters a loop that produces rounds until the game ends
  def play
    @flag = true
    puts "Let's Play Blackjack"
    puts "You start with 100 credits"
    puts "Play until you run out or you decide to quit"
    while (@player.chips_remaining > 0) && (@flag == true)
      @round.new_round
      keep_playing
    end
    if @flag == false
      puts "You quit. Thanks for playing"
    else
      puts "You ran out of chips. Better luck next time."
    end
  end

  # Queries the user for input on whether they'd like to keep playing
  def keep_playing
    puts "Would you like to play another hand? Yes or no"
    response = gets.chomp
    response.upcase!
    if  response == "YES" || response == "Y"
      @flag = true
    elsif response == "NO" || response == "N"
      @flag = false
    else
      puts "Invalid input"
      keep_playing
    end
  end
end

# Start and run the game
game = BlackjackGame.new
game.play
