require File.dirname(__FILE__) + "/test_helper"

class ChapterModelTest < Test::Unit::TestCase
  def test_chapter_is_set
    c1 = ChapterModel.new 1
    c2 = ChapterModel.new 2
    c3 = ChapterModel.new 999

    assert_equal(1, c1.reference)
    assert_equal(2, c2.reference)
    assert_equal(999, c3.reference)
  end

  def test_add_verse
    v1 = VerseModel.new 1
    v2 = VerseModel.new 2
    v3 = VerseModel.new 999
    c1 = ChapterModel.new 1

    c1.add_verse v1
    c1.add_verse v2
    c1.add_verse v3

    assert_equal(3, c1.verses.size)

    assert_equal(1, c1.verses[0].reference)
    assert_equal(2, c1.verses[1].reference)
    assert_equal(999, c1.verses[2].reference)
  end
end