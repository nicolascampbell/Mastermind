class Player
  attr_reader :role
  def initialize(role)
    @role=role
  end
  #checks if an input is numeric
  private def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  #ask for input in order to get a row of something(for guess or for advice or code)
  private def ask_input(length)
    i=0
    new_row=Array.new(length)
    while i!=length
      begin
        puts "Please write the #{i+1} number"
        input=gets
        if !is_numeric?(input) || input.to_i<=0 || input.to_i>6
          raise "Not a number or not within bounds"
        else
          new_row[i]=input.to_i
          i+=1
        end
      rescue => exception
        puts "***Please insert a number and one within 1->6 range***"
        retry
      end
    end
    return new_row
  end
  # only the player that is guesser the guesser can guess 
  def guess(length)
    if @role!="guesser"
      raise "You are not guesser"
    end
    puts "Lets make a new Guess! Please enter the numbers from left to right and after each
          number press enter"
    return ask_input(length)
  end
  # only the player that code maker the guesser can guess 
  def make_code(length)
    if @role!="code_maker"
      raise "You are not code_maker"
    end
    puts "Lets create the secret code! Please enter the numbers from left to right and after each
          number press enter"
    return ask_input(length)
  end
  #same 
  def give_advice(length)
    if @role!="code_maker"
      raise "You are not code_maker"
    end
    puts "Lets give some advice shall we? Please enter 1 when one of the numbers is in 
          correct place, 0 when its the right number in incorrect place, and -1
          when neither of the previous ones is the one"
    i=0
    new_advice=Array.new(length)
    while i!=length
      begin
        puts "Please write the #{i+1} advice"
        input=gets
        if is_numeric?(input)&&(input.to_i==1||input.to_i==0||input.to_i==-1)
          new_advice[i]=input.to_i
          i+=1
        else
          raise " "
        end
      rescue => exception
        puts "***Please insert a lead as told before***"
        retry
      end
    end
    return new_advice
  end

end
