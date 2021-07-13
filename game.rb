class Player
    attr_accessor :turn
    attr_reader :name, :symbol
    def initialize(name, symbol, turn = false)
        @name = name
        @symbol = symbol
        @turn = turn
    end
end

class PlayControl
    attr_accessor :fin
    attr_accessor :cnt
    def initialize
        @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        @fin = false
        @cnt = 0

    end

    def play(player)
        @cnt += 1
        to_s
        puts "It is your turn #{player.name}, what spot do you choose?"
        #{add error handling here}
        place = gets.chomp.to_i
        place -= 1
        
        row = place / 3
        col = place % 3
        @board[row][col] = player.symbol

        if win?(player)
            @fin = true
            print_final_message(player, false)
        elsif draw?
            @fin = true
            print_final_message(player, true)
        end


    end

    def win?(player)
        sym = player.symbol
        if (@board[0][0] == sym && @board[0][1] == sym && @board[0][2] == sym)
            return true
        elsif (@board[1][0] == sym && @board[1][1] == sym && @board[1][2] == sym)
            return true
        elsif (@board[2][0] == sym && @board[2][1] == sym && @board[2][2] == sym)
            return true
        elsif (@board[0][0] == sym && @board[1][0] == sym && @board[2][0] == sym)
            return true
        elsif (@board[0][1] == sym && @board[1][1] == sym && @board[2][1] == sym)
            return true
        elsif (@board[0][2] == sym && @board[1][2] == sym && @board[2][2] == sym)
            return true
        elsif (@board[0][0] == sym && @board[1][1] == sym && @board[2][2] == sym)
            return true
        elsif (@board[0][2] == sym && @board[1][1] == sym && @board[2][0] == sym)
            return true
        end
        
        return false
    end

    def draw?
        if @cnt == 9
            return true
        return false
        end
    end




    
    def print_final_message(player, draw = false)
        if draw
            puts "The game ended in a tie"
            return
        end
        puts "Congratulations #{player.name}, you have won the game!"
    end


    def to_s()
        @board.each do |row|
            puts "#{row[0]} | #{row[1]} | #{row[2]}"
            puts "----------"
        end
    end
end

#{add error handlin here} cant be numbers, not same with player 2 symbol
puts "Enter Player 1 name:"
name = gets.chomp
puts "Enter Player 1 symbol"
sym = gets.chomp

p1 = Player.new(name, sym, true)

puts "Enter Player 2 name:"
name = gets.chomp
puts "Enter Player 2 symbol"
sym = gets.chomp


p2 = Player.new(name, sym)

game = PlayControl.new()



while !game.fin
    if p1.turn
        puts p1.name
        game.play(p1)
        p2.turn = true
        p1.turn = false
    else
        game.play(p2)
        p1.turn = true
        p2.turn = false
    end
end



