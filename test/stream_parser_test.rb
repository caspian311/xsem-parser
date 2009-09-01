require 'test/unit'
require 'rexml/document'

require "lib/stream_parser"
require "lib/book"
require "lib/chapter"
require "lib/verse"

class StreamParserTest < Test::Unit::TestCase
	def test_parsing_test_file
		parser = StreamParser.new
		REXML::Document.parse_stream(File.open('test/test.xml'), parser)

		genesis = parser.books['GEN']
		matthew = parser.books['MAT']

		assert_equal('Genesis', genesis.title)
		assert_equal(2, genesis.chapters.size)
		assert_equal(2, genesis.chapters[0].verses.size)
		assert_equal(2, genesis.chapters[1].verses.size)
		assert_equal('In the beginning God created the heavens and the earth.', genesis.chapters[0].verses[0].text)
		assert_equal('And the earth was waste and void; and darkness was upon the face of the deep: and the Spirit of God moved upon the face of the waters.', genesis.chapters[0].verses[1].text)
		assert_equal('And the heavens and the earth were finished, and all the host of them.', genesis.chapters[1].verses[0].text)
		assert_equal('And on the seventh day God finished his work which he had made; and he rested on the seventh day from all his work which he had made.', genesis.chapters[1].verses[1].text)

		assert_equal('Matthew', matthew.title)
		assert_equal(2, matthew.chapters.size)
		assert_equal(2, matthew.chapters[0].verses.size)
		assert_equal(2, matthew.chapters[1].verses.size)
		assert_equal('The book of the generation of Jesus Christ, the son of David, the son of Abraham.', matthew.chapters[0].verses[0].text)
		assert_equal('Abraham begat Isaac; and Isaac begat Jacob; and Jacob begat Judah and his brethren;', matthew.chapters[0].verses[1].text)
		assert_equal('Now when Jesus was born in Bethlehem of Judaea in the days of Herod the king, behold, Wise-men from the east came to Jerusalem, saying,', matthew.chapters[1].verses[0].text)
		
	end
end

