
class Player
	
	attr_accessor :name, :symbol   #read&write attributes
	

	def initialize (name) #allows to create a player. we only have to type the name in
		@name = name
	end

end