require 'rexml/document'
require 'rexml/streamlistener'

require "lib/book"
require "lib/chapter"
require "lib/verse"

include REXML

class StreamParser
	include StreamListener

	attr_reader :books

	def initialize
		@books = {}
	end
	
	def tag_start(name, attributes)
		if name == 'bookDecl'
			@book_id = attribute_val(attributes, 'id')
		elsif name == 'shortName'
			@in_book_title = true
		elsif name == 'book'
			@current_book = books[attribute_val(attributes, 'value')]
		elsif name == 'chapter'
			@current_chapter = Chapter.new attribute_val(attributes, 'value')
			@current_book.add_chapter @current_chapter
		elsif name == 'verse'
			@current_verse = Verse.new attribute_val(attributes, 'value')
			@current_chapter.add_verse @current_verse
			@in_verse = true
		elsif name == 'verseEnd'
			@in_verse = false
		end
	end

	def tag_end(name)
		if name == 'bookDecl'
			@books[@book_id] = Book.new @book_title
		end
	end

	def text(text)
		if @in_book_title
			@book_title = text.strip
			@in_book_title = false
		elsif @in_verse
			@current_verse.text = text.strip
		end
	end

	def print
		puts "list of books..."
		@books.each_value do |book|
			puts "book: #{book.title}"
			book.chapters.each do |chapter|
				puts "   chapter: #{chapter.id}"
				chapter.verses.each do |verse|
					puts "      verse: #{verse.id}"
					puts "         text: #{verse.text}"
				end
			end
		end
	end


	private

	def attribute_val(attributes, key)
		value = nil
		attributes.each do |attribute_pair|
			if attribute_pair[0] == key
				value = attribute_pair[1]
				break
			end
		end
		return value
	end
end
