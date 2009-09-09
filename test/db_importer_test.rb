require File.dirname(__FILE__) + "/test_helper"

require File.dirname(__FILE__) + "/../lib/bible_model"

class DbImporterTest < Test::Unit::TestCase
  def setup
    Bible.all.each do |bible|
      bible.destroy
    end
  end

  def teardown
    Bible.all.each do |bible|
      bible.destroy
    end
  end

  def test_import
    bible1 = BibleModel.new 'ShortName'
    bible1.long_name = 'This is the long name'
    bible1.publisher = 'Bible Publishers Extrordinaire'

    book1 = BookModel.new 'book 1'
    book2 = BookModel.new 'book 2'

    chap1 = ChapterModel.new 1
    chap2 = ChapterModel.new 2

    verse1 = VerseModel.new 1
    verse1.text = 'this is verse 1'
    
    verse2 = VerseModel.new 2
    verse2.text = 'this is verse 2'

    chap1.verses << verse1
    chap1.verses << verse2

    verse1 = VerseModel.new 1
    verse1.text = 'this is another verse 1'

    verse2 = VerseModel.new 2
    verse2.text = 'this is another verse 2'

    chap2.verses << verse1
    chap2.verses << verse2

    book1.chapters << chap1
    book1.chapters << chap2

    chap1 = ChapterModel.new 3
    chap2 = ChapterModel.new 4

    book2.chapters << chap1
    book2.chapters << chap2

    bible1.books << book1
    bible1.books << book2

    importer = DbImporter.new bible1

    assert_equal 0, Bible.all.size
    assert_equal 0, Book.all.size
    assert_equal 0, Chapter.all.size
    assert_equal 0, Verse.all.size

    importer.import_into_db

    assert_equal 1, Bible.all.size
    assert_equal 2, Book.all.size
    assert_equal 4, Chapter.all.size
    assert_equal 4, Verse.all.size

    assert_equal 'ShortName', Bible.all[0].shortName
    assert_equal 'Bible Publishers Extrordinaire', Bible.all[0].publisher
    assert_equal 'This is the long name', Bible.all[0].longName
    assert_equal 'book 1', Book.all[0].title
    assert_equal 'book 2', Book.all[1].title
  end
end

class MockBookProvider
  attr_accessor :books

  def initialize
    @books = []
  end

end