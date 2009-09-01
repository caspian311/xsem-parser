require File.dirname(__FILE__) + "/test_helper"

class SqlBuilderTest < Test::Unit::TestCase
  def setup
    v1_1_1 = Verse.new 1
    v1_1_2 = Verse.new 2
    v1_2_1 = Verse.new 1
    v1_2_2 = Verse.new 2

    ch1_1 = Chapter.new 1
    ch1_2 = Chapter.new 2

    ch1_1.add_verse(v1_1_1)
    ch1_1.add_verse(v1_1_2)
    ch1_2.add_verse(v1_2_1)
    ch1_2.add_verse(v1_2_2)

    book1 = Book.new 'First Book'
    book1.add_chapter(ch1_1)
    book1.add_chapter(ch1_2)

    v2_1_1 = Verse.new 1
    v2_1_2 = Verse.new 2
    v2_2_1 = Verse.new 1
    v2_2_2 = Verse.new 2

    ch2_1 = Chapter.new 1
    ch2_2 = Chapter.new 2

    ch2_1.add_verse(v2_1_1)
    ch2_1.add_verse(v2_1_2)
    ch2_2.add_verse(v2_2_1)
    ch2_2.add_verse(v2_2_2)

    book2 = Book.new 'Second Book'
    book2.add_chapter(ch1_1)
    book2.add_chapter(ch1_2)
    
    @books = [book1, book2]
  end

  def test_generate_sql
    builder = SqlBuilder.new @books
    lines = builder.generate_sql
    assert_equal(8, lines.size)
  end
end
