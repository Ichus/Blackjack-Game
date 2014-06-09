README BlackJack Command Line Game README
------------------------------------------
This game allows one player to play blackjack against the dealer
You start with 100 credits and bet in 10 credit increments
follow the instructions on screen to play the game
When asked for input you can type the word or first letter. Either works

Objects

Card
Deck
Player
Dealer
ChipPool- deleted and moved to a method of player. Will be reinstated if there's more time to allow variable types of chips
Bet
Hand
BlackjackGame
Round
Chip

USE
-------------------------------------------
run "ruby -I. blackjack_game.rb" from the command line with all .rb files in same directory


To Add
-------------------------------------------
Add ChipPool class to allow variable types of chips and blackjack payout of 3/2
Add special blackjack payout for that matter
Add ability to disallow hitting once hand reaches 5 cards in length
Add abiliy for game to immediately notify you of busting instead of waiting for final calculation
Add ability for game to print the hand on the same line neatly
Add ability for game to repopulate the deck when empty
Add ability for game to kick you for zero chip count before asking if you'd like to keep playing

Known Issues
-------------------------------------------
Bug: You can occasionally doubledown when you don't have the chips to do it
Bug: Your bet currently doesn't have to be in increments of 10. That feature was in and working,
     but after altering other parts of the file which I was certain were unrelated it no
     longer works
Tidy the catastrophe which is the round.rb file
Tidy the blackjack_game.rb could also be tidied and expanded
Test: I couldn't get the tests to work. Placing the error I got into google didn't turn up any results
      I put running the tests on hold until the game functioned correctly
