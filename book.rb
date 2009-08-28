

class Book
	attr_reader :title
	attr_reader :chapters

	def initialize(title)
		@title = title
		@chapters = []
	end

	def add_chapter(chapter)
		@chapters += [chapter]
	end
end

