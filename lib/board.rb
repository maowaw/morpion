
require_relative 'boardcase'
require_relative 'show'

require 'bundler'
Bundler.require


class Board 

	attr_accessor  :board

#Initialise un board
	def initialize

	#Quand la classe s'initialize, elle crée 9 instances BoardCases rangées dans une array qui est l'attr_accessor de la classe
		@board =  [*1..9].map { |i| case_i = BoardCase.new(i).position }
	
	end


#Affiche le plateau
	def show_board

			board = @board 

    puts " "*10+"#{@board[0..2].join(" | ")}"
    puts " "*10+"--|---|--"
    puts " "*10+"#{@board[3..5].join(" | ")}"
    puts " "*10+"--|---|--"
    puts " "*10+"#{@board[6..8].join(" | ")}"
  
  end


	def play_turn (current_player)

	  #Tour du player 
	  	puts " #{current_player.name}, c'est à toi ! Où veux-tu jouer? (Numéro de case, de 1 à 9)\n\n"
	 
		#allow the player to type their choice in
			position = gets.chomp.to_i


			@board = @board.each_index.map { |e| e+1 == position && @board[e] != "X" && @board[e] != "O" ? @board[e] = current_player.symbol : @board[e] }

		
	end

	def victory?
    # On teste si les rangées ou diagonales contiennent des symboles identiques
    #Retourne true si conditions vérifiées, false sinon
    (@board[0] == @board[1] && @board[0] == @board[2]) || (@board[3] == @board[4] && @board[3] == @board[5]) || (@board[6] == @board[7] && @board[6] == @board[8] ) || (@board[0] == @board[3] && @board[0] == @board[6]) || (@board[1] == @board[4] && @board[1] == @board[7]) || (@board[2] == @board[5] && @board[2] == @board[8]) ||( @board[0] == @board[4] && @board[0] == @board[8]) || (@board[2] == @board[4] && @board[2] == @board[6])
  end


end





