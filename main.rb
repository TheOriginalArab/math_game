require './player'
require './question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
    @winner = nil
    @loser = nil
  end

  def start_game
    while @player1.lives > 0 && @player2.lives > 0
      question = Question.new
      puts "#{@current_player.name}: #{question.question}"
      print "> "
      answer = gets.chomp.to_i
      
      if question.correct?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end
      
      puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
      @current_player = (@current_player == @player1) ? @player2 : @player1
      if @player1.lives > 0 && @player2.lives > 0
        puts "\n"
        puts "----- NEW TURN -----"
      end
    end
    
    if @player1.lives > 0
      @winner = @player1
      @loser = @player2
    elsif @player2.lives > 0
      @winner = @player2
      @loser = @player1
    end

    puts "\n"
    puts "#{@loser.name} loses!"
    puts "#{@winner.name} wins with a score of #{@winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end

game = Game.new
game.start_game