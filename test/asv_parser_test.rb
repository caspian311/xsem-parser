require File.dirname(__FILE__) + "/test_helper"

require "rexml/document"

class AsvParserTest < Test::Unit::TestCase
  def test_parsing_test_file
		parser = AsvParser.new File.open(File.dirname(__FILE__) + '/test.xml')

    parser.books.each do |book|
      if book.title == 'Genesis'
        check_genesis book
      elsif book.title == 'Matthew'
        check_matthew book
      else
        flunk 'unrecognized book'
      end
    end
  end
  
  def check_genesis(book)
    assert_equal('Genesis', book.title)
    assert_equal(2, book.chapters.size)
    assert_equal(2, book.chapters[0].verses.size)
    assert_equal(2, book.chapters[1].verses.size)
    assert_equal('In the beginning God created the heavens and the earth.', book.chapters[0].verses[0].text)
    assert_equal('And the earth was waste and void; and darkness was upon the face of the deep: and the Spirit of God moved upon the face of the waters.', book.chapters[0].verses[1].text)
    assert_equal('And the heavens and the earth were finished, and all the host of them.', book.chapters[1].verses[0].text)
    assert_equal('And on the seventh day God finished his work which he had made; and he rested on the seventh day from all his work which he had made.', book.chapters[1].verses[1].text)
  end

  def check_matthew(book)
    assert_equal('Matthew', book.title)
    assert_equal(2, book.chapters.size)
    assert_equal(2, book.chapters[0].verses.size)
    assert_equal(2, book.chapters[1].verses.size)
    assert_equal('The book of the generation of Jesus Christ, the son of David, the son of Abraham.', book.chapters[0].verses[0].text)
    assert_equal('Abraham begat Isaac; and Isaac begat Jacob; and Jacob begat Judah and his brethren;', book.chapters[0].verses[1].text)
    assert_equal('Now when Jesus was born in Bethlehem of Judaea in the days of Herod the king, behold, Wise-men from the east came to Jerusalem, saying,', book.chapters[1].verses[0].text)
  end
end

