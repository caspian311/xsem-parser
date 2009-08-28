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

		doc.elements.each('usfx/book') do |book|
		   books << Book.new(book.elements["h"].text)
		end
	end


	def print_all
		puts "all titles..."
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
