require "test/unit"
require "app/book"
require "app/chapter"

class BookTest < Test::Unit::TestCase
  def test_book_title_is_set
    b = Book.new "sometext"
    assert_equal(b.title, "sometext")
  end

  def test_add_chapter
    c1 = Chapter.new 1
    c2 = Chapter.new 2
    c3 = Chapter.new 3

    b = Book.new "sometext"
    b.add_chapter c1
    b.add_chapter c2
    b.add_chapter c3

    assert_equal(3, b.chapters.size)
    assert_equal(1, b.chapters[0].id)
    assert_equal(2, b.chapters[1].id)
    assert_equal(3, b.chapters[2].id)
  end
end