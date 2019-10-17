require 'bundler'
Bundler.require



require_relative 'player'
require_relative 'board'
require_relative 'boardcase'
require_relative 'show'


class Game 

	attr_accessor :current_player, :status, :board, :array

	@@current_player = []

	def initialize
		puts "Yo les geeks, prêts à jouer au meilleur jeu du monde? Quel est ton nom?"
		print "> "
		input = gets.chomp

		player1 = Player.new(input)
		
		player1.symbol = "X"
		puts "Tu t'appelles #{player1.name} et ton symbole est #{player1.symbol}. \n"


		puts "Et toi derrière, quel est ton nom?"
		print "> "
		input = gets.chomp

		player2 = Player.new(input)
		player2.symbol = "O"
		puts "Tu t'appelles #{player2.name} et ton symbole est #{player2.symbol}. \n"

		@@current_player << player1
		@@current_player << player2


		@board = Board.new
		

	end



#Fait appel aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
	def turn
		
		while @board.victory? == false

			system "clear"
	    puts "=" * 40

	    puts " Voici où vous en êtes :"
			puts @board.show_board


			@@current_player. each do |player|
				@board.play_turn(player)
					

	# On arrête la boucle en cas de victoire
	     if @board.victory? == true
	      system "clear"
			  puts "============="
	      puts ""
	      puts "#{player.name} a gagné !"

	      puts "Voulez-vous rejouer? (Si oui tapez Y ou y, sinon tapez n'importe quelle touche)"
				input = gets.chomp

				if input == "y" || input == "Y"
					@@current_player = []
					load 'app.rb'
				else
	      	break
	    	end

	     end

	  	end
		end
	end



#Relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
	def new_round
		while @board.victory? == false
			self.turn #renvoie à la fonction turn
    end
  end

#Permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  def game_end
 
  end    


end 



