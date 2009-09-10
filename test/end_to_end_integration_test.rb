require File.dirname(__FILE__) + "/test_helper"

class EndToEndIntegrationTest < Test::Unit::TestCase
  def setup
    cleanup
  end

  def teardown
    cleanup
  end

  def cleanup
    Bible.all.each do |bible|
      bible.destroy
    end
  end

  def test_import_actual_file
    parser = AsvParser.new(AsvStreamListener.new)
    parser.parse File.open(File.dirname(__FILE__) + '/../data/asv-xsem.xml')

    bible_model = BibleModel.new 'ASV'
    bible_model.long_name = 'American Standard Version'
    bible_model.books = parser.books

    importer = DbImporter.new bible_model
    importer.import_into_db

    assert_equal 1, Bible.all.size
    asv_bible = Bible.all[0]

    # this is not right but it should show how many books in the failure message
    assert_equal 3, asv_bible.books.size
  end
end
