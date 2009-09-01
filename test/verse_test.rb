require File.dirname(__FILE__) + "/testhelper"

class VerseTest < Test::Unit::TestCase
  def test_initialize_with_id
    v1 = Verse.new 1
    v2 = Verse.new 2
    v3 = Verse.new 999

    assert_equal(1, v1.id)
    assert_equal(2, v2.id)
    assert_equal(999, v3.id)
  end

  def test_set_text
    v1 = Verse.new 1
    v1.text = "blah blah blah"

    assert_equal("blah blah blah", v1.text)
  end
end