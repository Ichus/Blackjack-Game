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
  end

  # called to start a new round and iterate through all the necessary steps
  def new_round
    self.take_bets
    self.set_hands
    self.show_hands
    if @player.chips_remaining >= @player_bet
      self.hit_or_stay
    else
      self.hit_or_stay_cont
    end
    @dealer.hit_til_stay unless @player.hand.bust
    self.show_dealer_hand
    if !(@dealer.hand.bust)
      self.winning_hand
    else
      self.dealer_bust
    end
  end

  # records input for bet and sends to place_bet method
  def take_bets
    puts "Please enter your bet in increments of 10. 100 is max bet"
    puts "You have #{@player.chips_remaining} remaining"
    @player_bet = gets.to_i
    @player_bet /= 10 # 10 is the currently the only value of chip used. change if implementing ChipPool class
    self.place_bet(@player_bet)
  end

  # checks whether bet input is valid and if so places the bet. Otherwise asks for input again
  def place_bet(bet)
    @player_bet = bet
    if (@player.can_bet(@player_bet) && @player_bet > 0 && @player_bet <=10) #&& (@player_bet % 10) == 0)
      @player.bet(@player_bet)
    else
      puts "Invalid bet."
      puts "You must bet at least one chip, and you can't bet more than you have"
      puts "Please enter your bet in increments of 10. 100 is max bet"
      puts "You have #{@player.chips_remaining} remaining"
      @player_bet = gets.to_i
      @player_bet /= 10 # 10 is the currently the only value of chip used. change if implementing ChipPool class
      self.place_bet(@player_bet)
    end
  end

  # assigns the player and dealer new hands for the new round
  # then deals cards alternating from player to dealer and back
  def set_hands(hand_size = 2)
    puts "Dealing cards"
    @player.new_hand
    @dealer.new_hand

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
    puts "You won the hand"
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
    if input == "HIT" || input == "H"
      @player.hand.hit
      self.show_player_hand
      self.hit_or_stay_cont
    elsif input == "STAY" || input == "S"
      puts "You stand"
    elsif input == "DOUBLEDOWN" || input == "D"
      @player.hand.hit
      @player.double_down
      self.show_player_hand
    else
      puts "Invalid input."
      self.hit_or_stay
    end
  end

  # allows user to hit until they wish to stay
  def hit_or_stay_cont
    puts "Would you like to hit or stay"
    input = gets.chomp.to_s
    input.upcase!
    if input == "HIT" || input == "H"
      @player.hand.hit
      self.show_player_hand
      self.hit_or_stay_cont
    elsif input == "STAY" || input == "S"
      puts "You stand"
    else
      puts "Invalid input. Enter hit or stay"
      self.hit_or_stay_cont
    end
  end

  # called when the dealer busts. prints a message and passes control to player_win
  def dealer_bust
    puts "The dealer busted. You win"
    self.player_win
  end

  # Checks to see whether the player busted, and then it checks to whether the
  # player has better, equal or worse hand then the dealer. updates accordingly
  # The check to see if dealer busts is done in new_round (This class is messy)
  def winning_hand
    if !(@player.hand.bust)
      if @player.hand.value > @dealer.hand.value
        self.player_win
      elsif @player.hand.value == @dealer.hand.value
        if @player.hand.blackjack? && !@dealer.hand.blackjack?
          self.player_win
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
