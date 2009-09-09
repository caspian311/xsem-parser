require File.dirname(__FILE__) + "/test_helper"

class BookModelTest < Test::Unit::TestCase
  def test_book_title_is_set
    b = BookModel.new "sometext"
    assert_equal(b.title, "sometext")
  end

  def test_add_chapter
    c1 = ChapterModel.new 1
    c2 = ChapterModel.new 2
    c3 = ChapterModel.new 3

    b = BookModel.new "sometext"
    b.add_chapter c1
    b.add_chapter c2
    b.add_chapter c3

    assert_equal(3, b.chapters.size)
    assert_equal(1, b.chapters[0].reference)
    assert_equal(2, b.chapters[1].reference)
    assert_equal(3, b.chapters[2].reference)
  end
end