#affiche le board
require 'bundler'
Bundler.require
require_relative 'board'

class Show 

	attr_accessor  :board



	def show_board

			board = @board 

    puts " "*10+"#{@board[0..2].join(" | ")}"
    puts " "*10+"--|---|--"
    puts " "*10+"#{@board[3..5].join(" | ")}"
    puts " "*10+"--|---|--"
    puts " "*10+"#{@board[6..8].join(" | ")}"
  
  end



end