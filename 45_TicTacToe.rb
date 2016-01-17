@field = [
         #0   #1   #2
        ["-", "-", "-"], #0
        ["-", "-", "-"], #1
        ["-", "-", "-"], #2
]

def print_field arr
  puts "\n   1  2  3 "
  arr.each_with_index  do |x, ind|
    puts "#{ind + 1}  #{x[0]}  #{x[1]}  #{x[2]} "
  end
end

def is_number? obj
  obj.to_s == obj.to_i.to_s
end

def comp_turn z
  puts "\nComputer's turn!"
  y = rand(0..2)
  q = rand(0..2)
  until @field[y][q] != @player && @field[y][q] == "-"
    y = rand(0..2)
    q = rand(0..2)
  end
  @field[y][q] = z
  print_field @field
  check_win @field
end

def player_turn u
  puts "\nIt's your turn!"
  print "\nWhat column? "
  c = gets.strip.to_i

  print "What line? "
  l = gets.strip.to_i
  #     if is_number? (c) == true && is_number? (l) == true
  @field[l - 1][c - 1] = @player

  print_field @field
  check_win @field
end

def check_win f
  if f[0][0] == f[0][1] && f[0][1] == f[0][2] && f[0][0] != "-"
    puts "\n#{f[0][0]} WINS!!!"
    exit
  elsif f[0][0] == f[1][0] && f[1][0] == f[2][0] && f[0][0] != "-"
    puts "\n#{f[0][0]} WINS!!!"
    exit
  elsif f[2][0] == f[2][1] && f[2][1] == f[2][2] && f[2][0] != "-"
    puts "\n#{f[2][0]} WINS!!!"
    exit
  elsif f[0][1] == f[1][1] && f[1][1] == f[2][1] && f[0][1] != "-"
    puts "\n#{f[0][1]} WINS!!!"
    exit
  elsif f[0][2] == f[1][2] && f[1][2] == f[2][2] && f[0][2] != "-"
    puts "\n#{f[0][2]} WINS!!!"
    exit
  elsif f[1][0] == f[1][1] && f[1][1] == f[1][2] && f[1][0] != "-"
    puts "\n#{f[1][0]} WINS!!!"
    exit
  elsif f[0][0] == f[1][1] && f[1][1] == f[2][2] && f[0][0] != "-"
    puts "\n#{f[0][0]} WINS!!!"
    exit
  elsif f[0][2] == f[1][1] && f[1][1] == f[2][0]  && f[0][2] != "-"
    puts "\n#{f[0][2]} WINS!!!"
    exit
  end

  draw = 0

  f.each_with_index do |x, ind|
    x.each do |z|
      if z == "-"
        break
      else
        draw = draw + 1
      end
    end
    if draw == 9
      puts "IT'S A DRAW!!!"
      exit
    end
  end
end

mark = ["X", "O"]
@player = mark[rand(0..1)]
puts "You are playing #{@player}! \nX goes first"

print_field @field

loop do
  if @player == "X"
    player_turn "X"
    comp_turn "O"
  else
    comp_turn "X"
    player_turn "O"
  end
end
