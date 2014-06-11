require "player"
require "dealer"
require "deck"

#
class Round
  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
    @player_bet = 0
    @MIN_BET = 0
    @MAX_BET = 10
  end

  # called to start a new round and iterate through all the necessary steps
  def new_round
    take_bets
    set_hands
    show_hands
    if @player.chip_pool >= @player_bet
      hit_or_stay
    else
      hit_or_stay_cont
    end
    @dealer.hit_til_stay unless @player.hand.bust
    show_dealer_hand
    if !(@dealer.hand.bust)
      winning_hand
    else
      dealer_bust
    end
  end

  # Takes a user's input. Once validated places a bet with @player.bet
  def take_bets
    bet_is_valid = false
    until bet_is_valid
      puts "Please enter your bet in increments of 10. 100 is max bet"
      puts "You have #{@player.chips_remaining} remaining"
      @player_bet = gets.to_i
      if (@player_bet % 10) == 0 # Prevents bets that aren't in increments of 10 from being made
        @player_bet /= 10 # 10 is the currently the only value of chip used. change if implementing ChipPool class
        if @player.can_bet(@player_bet) && @player_bet > @MIN_BET && @player_bet <= @MAX_BET
          @player.bet(@player_bet) # Places bet
          bet_is_valid = true # Breaks from loop
        else
          puts "Invalid bet."
        end
      else
        puts "Invalid bet"
      end
    end
  end

  # assigns the player and dealer new hands for the new round
  # then deals cards alternating from player to dealer and back
  def set_hands(hand_size = 2)
    puts "Dealing cards"
    @player.new_hand
    @dealer.new_hand

    @dealer.update_deck if @deck.cards_left < ((hand_size * 2) + 1) # Rebuilds deck if empty
    hand_size.times do
      @player.hand.hit
      @dealer.hand.hit
    end
  end

  # prints the dealer's and player's hand. somewhat redundant
  def show_hands
    puts "Dealer's hand is"
    @dealer.hand.print_hand
    puts "Your hand is"
    @player.hand.print_hand
  end

  # prints player's hand
  def show_player_hand
    puts "Your hand is"
    @player.hand.print_hand
  end

  # prints dealer's hand
  def show_dealer_hand
    puts "Dealer's hand is"
    @dealer.hand.print_hand
  end

  # called when the player wins. updates their credits and prints a message
  # notifying them of the updated contents
  def player_win
    @player.won_bet
    puts "You have #{@player.chips_remaining} remaining"
  end

  # allows the user to hit, stay or doubledown. Hitting passes control to
  # hit_or_stay_cont while standing or doubling down ends hitting
  # standing returns control to next method to be called
  # doubling down updates hand and bet to reflect doing so then returns control
  def hit_or_stay
    puts "Would you like to hit, stay or doubledown"
    input = gets.chomp.to_s
    input.upcase!
    @dealer.update_deck if @deck.cards_left < 1 # Rebuilds deck if empty
    if input == "HIT" || input == "H"
      @player.hand.hit
      show_player_hand
      return if @player.hand.bust # Escapes recursion if the player busts
      hit_or_stay_cont
    elsif input == "STAY" || input == "S"
      puts "You stand"
    elsif input == "DOUBLEDOWN" || input == "D"
      @player.hand.hit
      @player.double_down
      show_player_hand
    else
      puts "Invalid input."
      hit_or_stay
    end
  end

  # allows user to hit until they wish to stay
  def hit_or_stay_cont
    puts "Would you like to hit or stay"
    input = gets.chomp.to_s
    input.upcase!
    @dealer.update_deck if @deck.cards_left < 1 # rebuilds deck if empty
    if input == "HIT" || input == "H"
      @player.hand.hit
      show_player_hand
      return if @player.hand.bust # Escapes recursion if the player busts
      hit_or_stay_cont
    elsif input == "STAY" || input == "S"
      puts "You stand"
    else
      puts "Invalid input. Enter hit or stay"
      hit_or_stay_cont
    end
  end

  # called when the dealer busts. prints a message and passes control to player_win
  def dealer_bust
    puts "The dealer busted. You win"
    player_win
  end

  # Checks to see whether the player busted, and then it checks to whether the
  # player has better, equal or worse hand then the dealer. updates accordingly
  # The check to see if dealer busts is done in new_round (This class is messy)
  def winning_hand
    if !(@player.hand.bust)
      if @player.hand.value > @dealer.hand.value
        player_win
      elsif @player.hand.value == @dealer.hand.value
        if @player.hand.blackjack? && !@dealer.hand.blackjack?
          player_win
        else
          puts "The hand pushed"
          @player.push_bet
          puts "You have #{@player.chips_remaining} remaining"
        end
      else
        puts "You lost the hand"
        puts "You have #{@player.chips_remaining} remaining"
      end
    else
      puts "You busted"
      puts "You have #{@player.chips_remaining} remaining"
    end
  end
end
