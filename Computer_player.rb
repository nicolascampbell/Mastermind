require_relative "Player";
class ComputerPlayer < Player
  attr_reader :possible_solutions, :won
  def initialize (role)
    super(role)
    if role=="guesser"
      @guess_count=0
      @winning_guess=Array.new(4)
      @won=false
      @possible_solutions= [0,1,2,3].repeated_permutation(4).to_a
    end
  end

  def update_posible_solutions(last_guess,last_advice)
    if last_advice==[1,1,1,1]
      @winning_guess=last_guess
      @won=true
    else
      @possible_solutions=@possible_solutions.reject{|code| give_advice(last_guess,code)!=last_advice}
    end
  end
  
  def guess(last_guess=[],last_advice=[])
    if @role!="guesser"
      raise "The role given to computer is not guesser"
    end
    if @won
      return @winning_guess
    else
      guess=Array.new(4)
      if @guess_count==0
        guess=[1,1,2,2]
        @guess_count+=1
      else
        update_posible_solutions(last_guess,last_advice)
        guess=@possible_solutions[0]
        @guess_count+=1
      end
      return guess
    end
  end
  #creates a code random
  def make_code(length)
    if @role!="code_maker"
      raise "The role given to computer is not code_maker"
    end
    code=Array.new()
    length.times do
      code.push(rand(0..6))
    end
    return code
  end
  #gives advice for a given row
  def give_advice(last_guess, code)

    row_advice=Array.new()
    last_guess_statuses=Array.new(2) {Array.new(last_guess.length) {false} }
    for i in 0...code.length
      if code.include?(last_guess[i])
        if code[i]==last_guess[i]
          last_guess_statuses[0][i]=true
          last_guess_statuses[1][i]=true
          row_advice.push(1)
        end
      else
        last_guess_statuses[1][i]=true
        row_advice.push(-1)
      end
    end
    for i in 0...code.length
      if !last_guess_statuses[1][i]
        options=code.each_index.select{|j| code[j] == last_guess[i] && !last_guess_statuses[0][j]}
        if options.length != 0
          last_guess_statuses[0][options[0]]=true
          last_guess_statuses[1][i]=true
          row_advice.push(0)
        else
          last_guess_statuses[1][i]=true
          row_advice.push(-1)
        end
      end
    end
    return row_advice
  end
end

  c=ComputerPlayer.new("code_maker")
  print c.possible_solutions