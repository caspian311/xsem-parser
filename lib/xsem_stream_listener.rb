require 'rexml/streamlistener'

require "lib/bible_model"
require "lib/book_model"
require "lib/chapter_model"
require "lib/verse_model"

class XsemStreamListener
  include REXML::StreamListener

  def initialize
    @books = {}
  end

	def tag_start(name, attributes)
    if name == 'versionName'
      @getting_long_name = true;
		elsif name == 'versionAbbreviation'
      @getting_short_name = true;
		elsif name == 'bookDecl'
			@book_id = attribute_value(attributes, 'id')
		elsif name == 'shortName'
			@in_book_title = true
		elsif name == 'book'
			@current_book = @books[attribute_value(attributes, 'value')]
		elsif name == 'chapter'
			@current_chapter = ChapterModel.new attribute_value(attributes, 'value')
			@current_book.add_chapter @current_chapter
		elsif name == 'verse'
			@current_verse = VerseModel.new attribute_value(attributes, 'value')
			@current_chapter.add_verse @current_verse
			@in_verse = true
		elsif name == 'verseEnd'
			@in_verse = false
		end
	end

	def tag_end(name)
		if name == 'bookDecl'
			@books[@book_id] = BookModel.new @book_title
    elsif name == 'versionAbbreviation'
      @getting_short_name = false
		elsif name == 'versionName'
      @getting_long_name = false
    elsif name == 'shortName'
			@in_book_title = false
    end
	end

	def text(text)
    if @getting_long_name
      @long_name = text.strip
		elsif @getting_short_name
      @short_name = text.strip
		elsif @in_book_title
			@book_title = text.strip
		elsif @in_verse
			@current_verse.text = text.strip
		end
	end

  def bible
    bible = BibleModel.new @short_name
    bible.long_name = @long_name
    bible.books = @books.values
    
    return bible
  end

  private

	def attribute_value(attributes, key)
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
