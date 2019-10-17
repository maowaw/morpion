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
		
	#Initialisation du player1
		print "> "
		input = gets.chomp
		player1 = Player.new(input)
		player1.symbol = "X"

		puts "Tu t'appelles #{player1.name} et ton symbole est #{player1.symbol}. \n"

	#Initialisation du player2
		puts "Et toi derrière, quel est ton nom?"
		print "> "
		input = gets.chomp
		player2 = Player.new(input)
		player2.symbol = "O"
		
		puts "Tu t'appelles #{player2.name} et ton symbole est #{player2.symbol}. \n"

	#Insertion des joueurs dans un array
		@@current_player << player1
		@@current_player << player2

	#Création du board
		@board = Board.new
		
	end



#Affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
	def turn
		
	#condition permettant de relancer un tour, tant que la partie n'est pas gagnée
		while @board.victory? == false #&& @board.map{|boardcase| boardcase == /[1-9]/ }

			system "clear" #met au propre le terminal
	    puts "=" * 40

	    puts " Voici où vous en êtes :"
			puts @board.show_board #montre le board sous forme de grille


		#On va chercher les joueurs dans l'array current_player, et on les fait jouer chacun son tour
			@@current_player. each do |player|
				@board.play_turn(player)
					

		#On arrête la boucle en cas de victoire
	     if @board.victory? == true
	      system "clear"
			  puts "============="
	      puts ""
	      puts "#{player.name} a gagné !"

	  #On propose de rejouer
	      puts "Voulez-vous rejouer? (Si oui tapez Y ou y, sinon tapez n'importe quelle touche)"
				input = gets.chomp

				if input == "y" || input == "Y"
					@@current_player = [] #efface les joueurs précédents
					load 'app.rb' #recharge le jeu
				else
	      	break #on sort du programme
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



