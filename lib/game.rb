class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

  def play
    loop do
      @board.display
      puts "Player #{@current_player}, enter your move (row and column):"
      row, col = gets.chomp.split(',').map(&:to_i)

      if @board.valid_move?([row, col])
        @board.update([row, col], @current_player)
        if winner = @board.winner?
          @board.display
          puts "Player #{winner} wins!"
          break
        elsif @board.full?
          @board.display
          puts "It's a draw!"
          break
        else
          @current_player = @current_player == 'X' ? 'O' : 'X'
        end
      else
        puts "Invalid move. Try again."
      end
    end
  end
end