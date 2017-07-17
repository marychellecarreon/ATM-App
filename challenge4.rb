#PROBLEM
#Joseph is in a rush to make a really important purchase.
#He has no money on him so he has gone to withdraw money from BPI but has found that there are serious issues with their systems!
#Can you reprogram the atm so he can buy his romance novel??"



@selection = [
  { num: 1, name: 'BALINQUIRY'},
  { num: 2, name: 'WITHDRAW'},
  { num: 3, name: 'DEPOSIT'},
  { num: 4,name: 'QUIT'}]
@userinfo = [firstname: 'Geoff', lastname: 'Carreon', pin: 123456, money: 500]


def showatm
  puts '-' *130
  puts "atm machine".upcase.center(130, '-')
  puts '-' *130
  puts'-' *130
  puts "Welcome to BPI, your trusted bank company".upcase.center(130, '-')
  puts'-' *130
end

def enterpin
  puts '-' *130
  puts "Please enter your 6 digit pin number".center(130, '-')
  @getpin = gets.chomp.to_i
  @userinfo.each do |x|
      if @getpin == x[:pin]
      puts "Please proceed on the next step.".center(130, '-')

    else @getpin != x[:pin]
      puts "Your pin is incorrect. Please enter/confirm your pin.".center(130, '-')
      @getpin = gets.chomp.to_i
    end
  end
end


def showtrans
  puts '-' *130
  puts "Please select your transaction"
  @selection.each do |y|
    puts "#{y[:num]} . #{y[:name]}".center(130)
    end
    @ent= gets.chomp.to_i
    @selection.each do |y|
      if @ent == y[:num]
    puts "You have selected #{y[:name]}"
 end
end
end

def bal
  if @ent == 1
   @userinfo.each do |x|
     puts "Here's your balance #{x[:money]}"
     puts '-' *130
   end
 end
 end


 def withdraw
   if @ent == 2
   @userinfo.each do |x|
   puts "Your current balance is #{x[:money]}. How much do you want to withdraw?"
     @amount = gets.chomp.to_i
     if x[:money] >= @amount.to_i
      puts "Please take your money"
        @a = x[:money] - @amount.to_i
         x[:money] = @a
      puts "Your current balance is #{@a}."
    end

    if x[:money] < 0
      puts "Insufficient fund. Please confirm the amount of your withdrawal"
      @amount = gets.chomp.to_i
     end
    end
  end
end

def deposit
  if @ent == 3
  @userinfo.each do |x|
  puts "How much do you want to deposit?"
  @amount = gets.chomp.to_i
  @b = x[:money] + @amount.to_i
  x[:money] = @b
  puts "Your current balance is #{@b}"
  puts '-' *130
end
end
end


def last
  puts "Do you want another transaction. y or n?"
  @ans = gets.chomp
  case @ans
  when "y"
    puts "Please proceed further"
  when "n"
    puts "You may now get your card.Thank you for banking with us! Have a pleasant day!"
  end
  puts '-' *130
end

def programstart
showatm
enterpin
    @userinfo.each do |x|
   while  @getpin != x[:pin]
     puts "please re-enter your pin"
     @getpin = gets.chomp.to_i
end
end
showtrans
bal
withdraw
deposit
last
  while @ans == "y"
    showtrans
    bal
    withdraw
    deposit
    last
  end
end

programstart
