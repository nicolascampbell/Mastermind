class Player
  attr_reader :role
  def initialize(role)
    @role=role
  end

  private def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  def guess(length)
    puts "Lets make a new Guess! Please enter the numbers from left to right and after each number press enter"
    i=0
    new_row=Array.new(length)
    while i!=length
      begin
        puts "Please write the #{i+1} number"
        input=gets
        if !is_numeric?(input)
          raise "Not a number"
        else
          new_row[i]=input.to_i
          i+=1
        end
      rescue => exception
        puts "***Please insert a number***"
        retry
      end
    end
    return new_row
  end
end
c=Player.new("dw")
a=c.guess(3)
puts a.to_s