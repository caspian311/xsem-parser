class ChapterModel
	attr_reader :reference
	attr_reader :verses

	def initialize(reference)
		@reference = reference
		@verses = []
	end

	def add_verse(verse)
		@verses << verse
	end
end
