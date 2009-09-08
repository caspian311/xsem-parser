require File.dirname(__FILE__) + "/test_helper"

require 'test/unit'
require 'db_importer'

class DbImporterTest < Test::Unit::TestCase
  def test_import
    book_provider = BookProvider.new

    importer = DbImporter.new book_provider
    importer.import_into_db
  end
end

class BookProvider
  
end