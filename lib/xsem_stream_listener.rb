require 'rexml/streamlistener'

require "lib/book_model"
require "lib/chapter_model"
require "lib/verse_model"

class XsemStreamListener
  include REXML::StreamListener

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
			@current_book = @books[attribute_val(attributes, 'value')]
		elsif name == 'chapter'
			@current_chapter = ChapterModel.new attribute_val(attributes, 'value')
			@current_book.add_chapter @current_chapter
		elsif name == 'verse'
			@current_verse = VerseModel.new attribute_val(attributes, 'value')
			@current_chapter.add_verse @current_verse
			@in_verse = true
		elsif name == 'verseEnd'
			@in_verse = false
		end
	end

	def tag_end(name)
		if name == 'bookDecl'
			@books[@book_id] = BookModel.new @book_title
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
