
class Chapter
	attr_reader :id
	attr_reader :verses

	def initialize
		@verses = []
	end

	def add_verse(verse)
		@verses += [verse]
	end
end
