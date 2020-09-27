require_relative "Player";
class ComputerPlayer < Player
  def initialize (role)
    super(role)
  end

  def guess(length)
    if @role!="guesser"
      raise "The role given to computer is not guesser"
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
    if @role!="code_maker"
      raise "The role given to computer is not code_maker"
    end
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
      print i
      print last_guess_statuses
    end
    puts"--------------------------"
    for i in 0...code.length
      if !last_guess_statuses[1][i]
        options=code.each_index.select{|j| code[j] == last_guess[i] && !last_guess_statuses[0][j]}
        print last_guess_statuses
        print options
        puts last_guess[i]
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
  last_guess=[4,2,3,1]
  code=[1,2,3,4]
  a=c.give_advice(last_guess,code)
  print a