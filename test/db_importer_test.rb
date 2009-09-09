require File.dirname(__FILE__) + "/test_helper"

require 'test/unit'
require 'db_importer'
require 'connection_info'

class DbImporterTest < Test::Unit::TestCase
  def setup
    Book.all.each do |book|
      book.destroy
    end
  end

  def teardown
    Book.all.each do |book|
      book.destroy
    end
  end

  def test_import
    book1 = BookModel.new 'book 1'
    book2 = BookModel.new 'book 2'

    book_provider = MockBookProvider.new
    book_provider.books << book1
    book_provider.books << book2

    importer = DbImporter.new book_provider

    assert_equal 0, Book.all.size

    importer.import_into_db

    assert_equal 2, Book.all.size
    
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