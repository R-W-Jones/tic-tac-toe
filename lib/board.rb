class Board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def display
    system 'clear'
    puts "Tic-Tac-Toe"
    puts "-----------"
    @board.each do |row|
      puts row.join(' | ')
      puts "---------"
    end
  end

  def update(position, marker)
    row, col = position
    @board[row][col] = marker
  end

  def valid_move?(position)
    row, col = position
    @board[row][col] == ' '
  end

  def winner?
    (0..2).each do |i|
      return @board[i][0] if @board[i].uniq.length == 1 && @board[i][0] != ' '
      return @board[0][i] if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i] && @board[0][i] != ' '
    end
    return @board[0][0] if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2] && @board[0][0] != ' '
    return @board[0][2] if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0] && @board[0][2] != ' '
    nil
  end

  def full?
    @board.flatten.none? { |cell| cell == ' ' }
  end
end