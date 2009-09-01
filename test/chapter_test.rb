require File.dirname(__FILE__) + "/testhelper"

class ChapterTest < Test::Unit::TestCase
  def test_chapter_is_set
    c1 = Chapter.new 1
    c2 = Chapter.new 2
    c3 = Chapter.new 999

    assert_equal(1, c1.id)
    assert_equal(2, c2.id)
    assert_equal(999, c3.id)
  end

  def test_add_verse
    v1 = Verse.new 1
    v2 = Verse.new 2
    v3 = Verse.new 999
    c1 = Chapter.new 1

    c1.add_verse v1
    c1.add_verse v2
    c1.add_verse v3

    assert_equal(3, c1.verses.size)

    assert_equal(1, c1.verses[0].id)
    assert_equal(2, c1.verses[1].id)
    assert_equal(999, c1.verses[2].id)
  end
end