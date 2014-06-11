README BlackJack Command Line Game 
------------------------------------------
This game allows one player to play blackjack against the dealer
You start with 100 credits and bet in 10 credit increments
follow the instructions on screen to play the game
When asked for input you can type the word or first letter. Either works

All required features implemented

USE
-------------------------------------------
run "ruby -I. blackjack_game.rb" from the command line with all .rb files in same directory
to test run "rake" from the command line
  first comment out the lines game =BlackjackGame.new and game.play
    from blackjack_game.rb

To Add
-------------------------------------------
Add ability to disallow hitting once hand reaches 5 cards in length
Add ability for game to kick you for zero chip count before asking if you'd like to keep playing
Add ChipPool class to allow variable types of chips and blackjack payout of 3/2

Known Issues
-------------------------------------------
Test: now work. if the lines game =BlackjackGame.new and game.play are commented out
  tests for blackjack_game.rb and round.rb are still incomplete
