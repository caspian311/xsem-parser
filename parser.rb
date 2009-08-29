require 'rexml/document'
require 'book'
require 'chapter'
require 'verse'

class Parser
	attr_reader :books

	def initialize
		@books = []
	end

	def parse_file(filename)
		xml_file = File.new(filename);
		doc = REXML::Document.new xml_file

		doc.elements.each('*/book') do |book_element|
			book = Book.new(book_element.attributes['value'])
			book_element.elements.each('*/c') do |chapter_element|
				chapter = Chapter.new(chapter_element.attributes['id'])
				book.add_chapter chapter
				
				book_element.elements.each('*/v') do |verse_element|
					verse_id = verse_element.attributes['id']
					verse_text =verse_element.text
					verse = Verse.new(verse_id, verse_text)

					chapter.add_verse verse
				end
			end

			books << book
		end
	end


	def print_all
		books.each do |book|
			print "#{book.title}:\n"
			book.chapters.each do |chapter|
				print "   chapter #{chapter.id}:\n"
				chapter.verses.each do |verse|
					print "      #{verse.id} - #{verse.text}"
				end
			end
		end
	end
end
