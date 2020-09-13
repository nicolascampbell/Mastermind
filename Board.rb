class Board
  attr_reader :rows,:cols
  #initialized the board with default size
  def initialize(rows=12,cols=4)
    @rows=rows
    @cols=cols
    @board=Array.new(rows) {Array.new(cols) {"-"} }
    @leads=Array.new(rows) {Array.new(cols) {"-"} }
    @used_rows_board=0
    @used_rows_leads=0
  end
  #prints board with leads too
  def print_board
    for i in 0...@rows
      puts"______________________"
      print "     |"
      for j in 0...@cols/2
        print @leads[i][j]
      end
      puts ""
      for j in 0...@cols
        print @board[i][j]
      end
      puts ""
      print"     |"
      for j in @cols/2...@cols
        print @leads[i][j]
      end
      puts ""
    end
  end
  #separate method for board to set its new rows
  def set_row_board(new_row)
    if @used_rows_board<@rows && new_row.length==@cols
      for i in 0...@cols
        @board[@used_rows_board][i]=new_row[i]
      end
      @used_rows_board+=1
    else
      raise "the board is already full"
    end
  end
  #same functionality as above but with leads
  def set_row_lead(new_row)
    if @used_rows_leads<@rows && new_row.length==@cols
      for i in 0...@cols
        @leads[@used_rows_leads][i]=new_row[i]
      end
      @used_rows_leads+=1
    else
      raise "the board is already full"
    end
  end

end
x=Board.new()
x.print_board()
x.set_row_board([1,2,3,4])
puts"****************************"
x.print_board()
puts"****************************"
x.set_row_lead(['+','q','1','/'])
x.print_board()