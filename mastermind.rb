require_relative "Player";require_relative "Board";require_relative "Computer_player";
class Mastermind
  def initialize()
    @board=Board.new()
    @player=Player.new("code_maker")
    @computer_player=ComputerPlayer.new("guesser")
    @code=Array.new(4)
    @last_guess=Array.new(4)
    @last_advice=Array.new(4)
  end
  def won?()
    @computer_player.won
  end
  def play()
    @code=@player.make_code(4)
    @board.print_board
    while !won?
      @last_guess=@computer_player.guess(@last_guess,@last_advice)
      print @last_guess
      @last_advice=@player.give_advice(4)
      @board.set_row_board(@last_guess.to_a)
      @board.set_row_lead(@last_advice)
      @board.print_board
    end
  end
end
game=Mastermind.new()
game.play()