require File.dirname(__FILE__) + "/test_helper"

class VerseModelTest < Test::Unit::TestCase
  def test_initialize_with_id
    v1 = VerseModel.new 1
    v2 = VerseModel.new 2
    v3 = VerseModel.new 999

    assert_equal(1, v1.reference)
    assert_equal(2, v2.reference)
    assert_equal(999, v3.reference)
  end

  def test_set_text
    v1 = VerseModel.new 1
    v1.text = "blah blah blah"

    assert_equal("blah blah blah", v1.text)
  end
end