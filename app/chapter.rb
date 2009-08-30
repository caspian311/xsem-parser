class Chapter
	attr_reader :id
	attr_reader :verses

	def initialize(id)
		@id = id
		@verses = []
	end

	def add_verse(verse)
		@verses += [verse]
	end
end
