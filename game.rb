=begin
First enter your name and on new line enter what you wanna use:
rock, paper, scissor type r, p, s

############################
#    EXAMPLE OF INPUT     #
#    sam                  #
#    rock                 #
#                 #
#         OR      #
#                 #
#    sam                  #
#    r                    #
###############################

*developed by jatin pandya*
=end

class Player
attr_reader :choice
attr_accessor :name

def initialize(n = "CPU")
@name = n
@choice = ["Rock", "Paper", "Scissors"]
end

def play(x = nil)
  if x == nil
    x = (rand(1..50)+rand(100..150))%3
  end
return x
end

end

def game(x, y)
result = 0
if(x == y)
result = 0
elsif(x == 0 && y == 2 || x == 1 && y == 0 || x == 2 && y == 1)
result = 1
else
result = 2
end
return result
end

name = gets.chomp
cho = gets

if cho != nil
    cho[-1] = ""
    cho.downcase!
end

p1 = Player.new(name)
p2 = Player.new

case cho
when "rock", "r"
    p1_choice = p1.play(0)
when "paper", "p"
    p1_choice = p1.play(1)
when "scissor", "s"
    p1_choice = p1.play(2)
else
    p1_choice = p1.play
end

p2_choice = p2.play

res = game(p1_choice, p2_choice)

puts "Round start:"

case res
when 0
    puts "Both #{p1.name} and #{p2.name} use #{p1.choice[p1_choice]}, it is a DRAW!"
when 1
    puts "#{p1.name} uses #{p1.choice[p1_choice]} while #{p2.name} uses #{p2.choice[p2_choice]}, #{p1.name} win!"
when 2
    puts "#{p1.name} uses #{p1.choice[p1_choice]} while #{p2.name} uses #{p2.choice[p2_choice]}, #{p2.name} win!"
end

puts
puts "[**] SOME RANDOM ROUND [**]"

round_times = 5
victory_count = [0, 0, 0]

round_times.times {|n|
    p1_choice = p1.play
    p2_choice = p2.play

res = game(p1_choice, p2_choice)
puts "Random round #{n+1}:"
case res
when 0
    puts "Both #{p1.name} and #{p2.name} use #{p1.choice[p1_choice]}, it is a DRAW!"
    victory_count[0]+=1
when 1
    puts "#{p1.name} uses #{p1.choice[p1_choice]} while #{p2.name} uses #{p2.choice[p2_choice]}, #{p1.name} win!"
    victory_count[1]+=1
when 2
    puts "#{p1.name} uses #{p1.choice[p1_choice]} while #{p2.name} uses #{p2.choice[p2_choice]}, #{p2.name} win!"
    victory_count[2]+=1
end
}

puts
puts "Number of #{p1.name}`s victory: #{victory_count[1]}"
puts "Number of #{p2.name}`s victory: #{victory_count[2]}"
puts "Number of draws: #{victory_count[0]}"
puts

if victory_count[1] > victory_count [2] and victory_count[1] > victory_count[0]
    puts "Hey! You sure are lucky!"
elsif victory_count[1] < victory_count [2] and victory_count[2] > victory_count[0]
    puts "Mmh... You are not that lucky..."
else
    puts "Not lucky, not unlucky!"
end
